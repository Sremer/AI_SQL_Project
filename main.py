import json
import mysql.connector
from openai import OpenAI
import os
from time import time

print("starting program\n")

# mysql
password = os.getenv('password')
database = os.getenv('database')

fdir = os.path.dirname(__file__)
def getPath(fname):
    return os.path.join(fdir, fname)


cnx = mysql.connector.connect(user='root', password=password,
                              host='127.0.0.1',
                              database=database)
cursor = cnx.cursor()

setup_sql_path = getPath("setup_sql.sql")
with(open(setup_sql_path) as setup_sql_file):
    setup_sql_script = setup_sql_file.read()


def execute_query(query):
    cursor.execute(query)
    return cursor.fetchall()


# openAI
client = OpenAI()


def sanitizeForJustSql(value):
    gptStartSqlMarker = "```sql"
    gptEndSqlMarker = "```"
    if gptStartSqlMarker in value:
        value = value.split(gptStartSqlMarker)[1]
    if gptEndSqlMarker in value:
        value = value.split(gptEndSqlMarker)[0]

    return value


def get_chat_response(context, content):
    completion = client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[
            {"role": "system", "content": context},
            {
                "role": "user",
                "content": content
            }
        ]
    )
    return completion.choices[0].message.content


sql_context = "You only respond with sql queries that answer the question. Use mysql syntax. If there is an error, don't explain it."
normal_context = "You can only answer the question using any results provided."
strategies = {
    "zero-shot": setup_sql_script,
    "single_domain_double_shot": (setup_sql_script +
                                " What is the best crop to plant in summer if the season is 28 days long and I want to maximize profit? " +
                                " SELECT crop_name FROM crop WHERE season_id = (SELECT id FROM season WHERE season_name = 'summer') ORDER BY (28 / grow_time) * single_unit_sell_price DESC LIMIT 1; " +
                                " What fish and crops can be found in the same season? " +
                                " SELECT DISTINCT f.fish_name, c.crop_name, s.season_name FROM fish f JOIN fish_season fs ON f.id = fs.fish_id JOIN season s ON fs.season_id = s.id JOIN crop c ON c.season_id = s.id;")
}

questions = [
    "Which fish can be caught in the spring?",
    "What is the best crop to plant in summer if the season is 28 days long and I want to maximize profit?",
    "What fish would give me the best profit in the summer?",
    "What fish can be caught in all seasons?",
    "What are all the different things I can get in fall?",
    "What are the top 5 things I can get profit from and what seasons are they in?",
    "If I can only plant 3 kinds of crops each season and each season is 28 days long, which 3 crops should I plant for each season to maximize profit?",
    "What location can I find the most fish at?",
    "What combination of 1 crop, 1 foraged item, and 1 fish would give me the most profit?",
    "How many different crops can I grow in less than 5 days and what are they?"
]

for strategy in strategies:
    print("strategy:", strategy, '\n')
    responses = {"strategy": strategy, "prompt_prefix": strategies[strategy]}
    question_results = []
    for question in questions:
        error = "None"
        print("question:", question)
        try:
            sql = sanitizeForJustSql(get_chat_response(sql_context, strategies[strategy] + " " + question))
            print(sql)
            result = str(execute_query(sql))
            print(result)
            friendlyResultsPrompt = "I asked a question \"" + question + "\" and the response was \"" + result + "\" Please, just give a concise response in a more friendly way? Please do not give any other suggests or chatter."
            friendlyResult = get_chat_response(normal_context, friendlyResultsPrompt)
            print(friendlyResult)
            print('\n')
        except Exception as err:
            error = str(err)
            print(err, "\n")

        question_results.append({
            "question": question,
            "sql": sql,
            "queryRawResponse": result,
            "friendlyResponse": friendlyResult,
            "error": error
        })
    print('\n')
    responses["questionResults"] = question_results
    with open(getPath(f"response_{strategy}_{time()}.json"), "w") as outFile:
        json.dump(question_results, outFile, indent=2)

cursor.close()
cnx.close()

print("program finished")
