
create table commissioner (
	id int not null auto_increment,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100) unique,
    password varchar(100),
    primary key (id)
);

create table league (
	id int not null auto_increment,
    league_name varchar(100),
    commissioner_id int not null,
    primary key (id),
    foreign key (commissioner_id) references commissioner(id)
);


create table team (
	id int not null auto_increment,
    team_name varchar(100),
    team_abbr varchar(100),
    wins int,
    losses int,
    league_id int not null,
    win_percentage double,
    games_back double,
    photo longblob,
    primary key (id),
    foreign key (league_id) references league(id)
);

create table stats (
	id int not null auto_increment,
    pa_count int,
    at_bats int,
    average double,
    obp double,
    slugging double,
    hits int,
    singles int,
    doubles int,
    triples int,
    homeruns int,
    rbis int,
    runs int,
    walks int,
    strikeouts int,
    primary key(id)
);

create table player (
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    team_id int,
    lineup_id int,
    stats_id int,
    primary key(id),
	foreign key(stats_id) references stats(id)
);

create table game (
	id int not null auto_increment,
    home_team_id int,
    away_team_id int,
    away_score int,
    home_score int,
    away_hits int,
    home_hits int,
    end_game boolean,
    primary key(id),
    foreign key(home_team_id) references team(id),
    foreign key(away_team_id) references team(id)
);

create table plate_appearance (
	id int not null auto_increment,
    game_id int,
    player_id int not null,
    strikes int,
    balls int,
    base int,
    outs int,
    inning_num int,
    home_index int,
    away_index int,
    runs int,
    in_play boolean,
    is_sacfly boolean,
    primary key (id),
    foreign key(game_id) references game(id),
    foreign key(player_id) references player(id)
);

