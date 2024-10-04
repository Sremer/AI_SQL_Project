create table season (
	id int auto_increment primary key,
    season_name varchar(10) not null unique
);

create table crop (
	id int auto_increment primary key,
    crop_name varchar(20) not null unique,
    grow_time int not null,
    single_unit_sell_price int not null,
    multiple_harvests boolean not null,
    season_id int not null,
    foreign key (season_id) references season(id)
);

create table fish (
	id int auto_increment primary key,
    fish_name varchar(20) not null unique,
    sell_price int not null,
    location varchar(20) not null
);

create table fish_season (
    fish_id int not null,
    season_id int not null,
    primary key (fish_id, season_id),
    foreign key (fish_id) references fish(id),
    foreign key (season_id) references season(id)
);

create table forage_items (
	id int auto_increment primary key,
    item_name varchar(20) not null unique,
    sell_price int not null,
    season_id int not null, 
    foreign key (season_id) references season(id)
);
    