insert into season (season_name)
values ("spring");
insert into season (season_name)
values ("summer");
insert into season (season_name)
values ("fall");
insert into season (season_name)
values ("winter");

insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("califlower", 12, 175, false, 1);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("green bean", 10, 40, true, 1);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("parsnip", 4, 35, false, 1);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("potato", 6, 80, false, 1);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("strawberry", 8, 120, true, 1);

insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("blueberry", 13, 50, true, 2);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("hops", 11, 25, false, 2);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("hot pepper", 5, 40, false, 2);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("melon", 12, 250, false, 2);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("radish", 6, 90, false, 2);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("starfruit", 13, 75, false, 2);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("tomato", 11, 60, true, 2);

insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("beet", 6, 100, false, 3);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("bok choy", 4, 80, false, 3);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("cranberries", 7, 75, true, 3);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("eggplant", 5, 60, true, 3);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("grape", 10, 80, true, 3);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("pumpkin", 12, 320, false, 3);
insert into crop (crop_name, grow_time, single_unit_sell_price, multiple_harvests, season_id)
values ("yam", 10, 160, false, 3);

insert into fish (fish_name, sell_price, location)
values ("pufferfish", 200, "ocean");
insert into fish (fish_name, sell_price, location)
values ("anchovy", 30, "ocean");
insert into fish (fish_name, sell_price, location)
values ("tuna", 100, "ocean");
insert into fish (fish_name, sell_price, location)
values ("sardine", 40, "ocean");
insert into fish (fish_name, sell_price, location)
values ("bream", 45, "river");
insert into fish (fish_name, sell_price, location)
values ("largemouth bass", 100, "mountain lake");
insert into fish (fish_name, sell_price, location)
values ("smallmouth bass", 50, "river");
insert into fish (fish_name, sell_price, location)
values ("rainbow trout", 65, "river");
insert into fish (fish_name, sell_price, location)
values ("salmon", 75, "river");
insert into fish (fish_name, sell_price, location)
values ("walleye", 105, "river");
insert into fish (fish_name, sell_price, location)
values ("perch", 55, "river");

insert into fish_season
values(1, 2);
insert into fish_season
values(2, 1);
insert into fish_season
values(2, 3);
insert into fish_season
values(3, 2);
insert into fish_season
values(3, 4);
insert into fish_season
values(4, 1);
insert into fish_season
values(4, 3);
insert into fish_season
values(4, 4);
insert into fish_season
values(5, 1);
insert into fish_season
values(5, 2);
insert into fish_season
values(5, 3);
insert into fish_season
values(5, 4);
insert into fish_season
values(6, 1);
insert into fish_season
values(6, 2);
insert into fish_season
values(6, 4);
insert into fish_season
values(6, 3);
insert into fish_season
values(7, 1);
insert into fish_season
values(7, 3);
insert into fish_season
values(8, 2);
insert into fish_season
values(9, 3);
insert into fish_season
values(10, 3);
insert into fish_season
values(10, 4);
insert into fish_season
values(11, 4);

insert into forage_items (item_name, sell_price, season_id)
values ("leek", 60, 1);
insert into forage_items (item_name, sell_price, season_id)
values ("daffodil", 30, 1);
insert into forage_items (item_name, sell_price, season_id)
values ("dandelion", 40, 1);
insert into forage_items (item_name, sell_price, season_id)
values ("wild horseradish", 50, 1);

insert into forage_items (item_name, sell_price, season_id)
values ("grape", 80, 2);
insert into forage_items (item_name, sell_price, season_id)
values ("spice berry", 80, 2);
insert into forage_items (item_name, sell_price, season_id)
values ("sweet pea", 50, 2);

insert into forage_items (item_name, sell_price, season_id)
values ("blackberry", 20, 3);
insert into forage_items (item_name, sell_price, season_id)
values ("common mushroom", 40, 3);
insert into forage_items (item_name, sell_price, season_id)
values ("hazelnut", 90, 3);
insert into forage_items (item_name, sell_price, season_id)
values ("wild plum", 80, 3);

insert into forage_items (item_name, sell_price, season_id)
values ("crocus", 60, 4);
insert into forage_items (item_name, sell_price, season_id)
values ("crystal fruit", 150, 4);
insert into forage_items (item_name, sell_price, season_id)
values ("snow yam", 100, 4);
insert into forage_items (item_name, sell_price, season_id)
values ("winter root", 70, 4);


