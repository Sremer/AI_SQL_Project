# AI SQL Project

* The script for running the project is in main.py
* The two json files contain the example questions and answers
* The eer_diagram.png contains the diagram of the database schema
* The sql files are used to setup the database schema and populate it with data

The purpose my database is to show information useful for the videogame "Stardew Valley". It allows you to see information like what season some items are available in and what price they sell for. 

### Examples

* Example question and response that worked:

question: If I can only plant 3 kinds of crops each season and each season is 28 days long, which 3 crops should I plant for each season to maximize profit?

SELECT season.season_name, 
       crop.crop_name, 
       crop.single_unit_sell_price * (28 / crop.grow_time) AS profit
FROM crop
JOIN season ON crop.season_id = season.id
GROUP BY season.id, crop.id
ORDER BY season.id, profit DESC;

[('spring', 'strawberry', Decimal('420.0000')), ('spring', 'califlower', Decimal('408.3333')), ('spring', 'potato', Decimal('373.3333')), ('spring', 'parsnip', Decimal('245.0000')), ('spring', 'green bean', Decimal('112.0000')), ('summer', 'melon', Decimal('583.3333')), ('summer', 'radish', Decimal('420.0000')), ('summer', 'hot pepper', Decimal('224.0000')), ('summer', 'starfruit', Decimal('161.5385')), ('summer', 'tomato', Decimal('152.7273')), ('summer', 'blueberry', Decimal('107.6923')), ('summer', 'hops', Decimal('63.6364')), ('fall', 'pumpkin', Decimal('746.6667')), ('fall', 'bok choy', Decimal('560.0000')), ('fall', 'beet', Decimal('466.6667')), ('fall', 'yam', Decimal('448.0000')), ('fall', 'eggplant', Decimal('336.0000')), ('fall', 'cranberries', Decimal('300.0000')), ('fall', 'grape', Decimal('224.0000'))]
For maximizing profit, you should plant:

**Spring:** Strawberry, Cauliflower, Potato  
**Summer:** Melon, Radish, Hot Pepper  
**Fall:** Pumpkin, Bok Choy, Beet

* Example question and response that failed:

question: If I can only plant 3 kinds of crops each season and each season is 28 days long, which 3 crops should I plant for each season to maximize profit?

SELECT 
    s.season_name, 
    c.crop_name, 
    c.single_unit_sell_price * (28 / c.grow_time) AS total_profit
FROM 
    season s
JOIN 
    crop c ON s.id = c.season_id
ORDER BY 
    s.id, total_profit DESC
LIMIT 3;

[('spring', 'strawberry', Decimal('420.0000')), ('spring', 'califlower', Decimal('408.3333')), ('spring', 'potato', Decimal('373.3333'))]

For spring, you should plant strawberries, cauliflower, and potatoes to maximize profit!

### Discussion of strategies

The two strategies that I employed were the zero-shot and the one domain multi-shot strategies. The interesting thing that I saw that I wasn't expecting was that for my few questions, the zero-shot actually had better accuracy. The examples above of the successful and unsuccessful questions are the same question and the successful one came from zero-shot while the unsuccessful came from the one domain multi-shot. The one domain multi-shot limited itself to one season whereas the zero-shot did not. This could be because one of the example prompts had to do with summer so chat-GPT only decided to look into summer. The context seem to actually confuse it. 
