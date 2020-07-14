--Complete your queries below--


--**Create skill table**
CREATE TABLE skill
(id NUMBER(11),
name VARCHAR(100)NOT NULL
);


--**Create city table**
CREATE TABLE city
(
id NUMBER(11),
name VARCHAR(100),
CONSTRAINT city_pk PRIMARY KEY(id)
);


-- **Create venue table**
CREATE TABLE venue
(
id NUMBER(11),
name VARCHAR(100)NOT NULL,
city_id NUMBER(11)NOT NULL,
CONSTRAINT venue_pk PRIMARY KEY(id),
CONSTRAINT venue_fk FOREIGN KEY(city_id) REFERENCES city(id)
);


--**Create team table**
CREATE TABLE team
(
id NUMBER(11),
name VARCHAR(100)NOT NULL,
coach VARCHAR(100)NOT NULL,
home_city_id NUMBER(11)NOT NULL,
captain NUMBER(11),
CONSTRAINT team_pk PRIMARY KEY(id),
CONSTRAINT team_fk FOREIGN KEY(home_city_id) REFERENCES city(id) 
);


-- **Create player table**
CREATE TABLE player
(
id NUMBER(11),
name VARCHAR(100)NOT NULL,
country VARCHAR(100)NOT NULL,
skill_id NUMBER(11)NOT NULL,
team_id NUMBER(11)NOT NULL,
CONSTRAINT player_pk PRIMARY KEY(id),
CONSTRAINT player_fk FOREIGN KEY(skill_id) REFERENCES skill(id) ,
CONSTRAINT player_fk FOREIGN KEY(team_id) REFERENCES team(id)
);
-- **Create outcome table**
CREATE TABLE outcome
(
id NUMBER(11),
status VARCHAR(100)NOT NULL,
winner_team_id NUMBER(11),
wickets NUMBER(20),
runs NUMBER(11),
player_of_match NUMBER(11),
CONSTRAINT outcome_pk PRIMARY KEY(id),
CONSTRAINT outcome_fk FOREIGN KEY(winner_team_id) REFERENCES team(id),
CONSTRAINT outcome_fk FOREIGN KEY(player_of_match) REFERENCES player(id)
);
-- **Create innings table**
CREATE TABLE innings
(
id NUMBER(11),
batting_team_id NUMBER(11)NOT NULL,
CONSTRAINT innings_pk PRIMARY KEY(id),
CONSTRAINT innings_fk FOREIGN KEY(batting_team_id) REFERENCES team(id)
);
-- **Create game table**
CREATE TABLE game
(
id NUMBER(11),
game_date DATE NOT NULL,
team_id_1 NUMBER(11)NOT NULL,
team_id_2 NUMBER(11)NOT NULL,
venue_id NUMBER(11)NOT NULL,
outcome_id NUMBER(11)NOT NULL,
first_innings_id NUMBER(11),
second_innings_id NUMBER(11),
CONSTRAINT game_pk PRIMARY KEY(id),
CONSTRAINT game_fk FOREIGN KEY(team_id_1) REFERENCES team(id),
CONSTRAINT game_fk FOREIGN KEY(team_id_2) REFERENCES team(id),
CONSTRAINT game_fk FOREIGN KEY(venue_id) REFERENCES venue(id),
CONSTRAINT game_fk FOREIGN KEY(outcome_id) REFERENCES outcome(id),
CONSTRAINT game_fk FOREIGN KEY(first_innings_id) REFERENCES innings(id),
CONSTRAINT game_fk FOREIGN KEY(second_innings_id) REFERENCES innings(id)
);
-- **Create umpire table**
CREATE TABLE umpire
(
id NUMBER(11),
name VARCHAR(100)NOT NULL,
CONSTRAINT umpire_pk PRIMARY KEY(id)
);
-- **Create umpire_type table**
CREATE TABLE umpire_type
(
id NUMBER(11),
type VARCHAR(100)NOT NULL,
CONSTRAINT umpire_type_pk PRIMARY KEY(id)
);
-- **Create game_umpire_type table**
CREATE TABLE game_umpire_type
(
id NUMBER(11),
game_id NUMBER(11)NOT NULL,
umpire_id NUMBER(11)NOT NULL,
umpire_type_id NUMBER(11)NOT NULL,
CONSTRAINT game_umpire_type_pK PRIMARY KEY(id),
CONSTRAINT game_umpire_type_fk FOREIGN KEY(game_id) REFERENCES game(id),
CONSTRAINT game_umpire_type_fk FOREIGN KEY(umpire_id) REFERENCES umpire(id),
CONSTRAINT game_umpire_type_fk FOREIGN KEY(umpire_type_id) REFERENCES umpire_type(id)
);
-- **Create wicket_type table**
CREATE TABLE wicket_type
(
id NUMBER(11),
name VARCHAR(100)NOT NULL,
CONSTRAINT wicket_type_pk PRIMARY KEY(id)
);
-- **Change delivery table**
CREATE TABLE delivery
(
id NUMBER(11),
innings_id NUMBER(11)NOT NULL,
over NUMBER(11)NOT NULL,
ball NUMBER(11)NOT NULL,
batsman_id NUMBER(11)NOT NULL,
bowler_id NUMBER(11)NOT NULL,
non_striker_id NUMBER(11)NOT NULL,
runs NUMBER(11)NOT NULL,
CONSTRAINT delivery_pk PRIMARY KEY(id),
CONSTRAINT delivery_fk FOREIGN KEY(innings_id) REFERENCES innings(id),
CONSTRAINT delivery_fk FOREIGN KEY(batsman_id) REFERENCES player(id),
CONSTRAINT delivery_fk FOREIGN KEY(bowler_id) REFERENCES player(id),
CONSTRAINT delivery_fk FOREIGN KEY(non_striker_id) REFERENCES player(id)
);
-- **Change wicket table**
CREATE TABLE wicket
(
id NUMBER(11),
delivery_id NUMBER(11)NOT NULL,
wicket_type_id NUMBER(11)NOT NULL,
player_id NUMBER(11)NOT NULL,
fielder_id NUMBER(11),
CONSTRAINT wicket_pk PRIMARY KEY(id),
CONSTRAINT wicket_fk FOREIGN KEY(delivery_id) REFERENCES delivery(id),
CONSTRAINT wicket_fk FOREIGN KEY(wicket_type_id) REFERENCES wicket_type(id),
CONSTRAINT wicket_fk FOREIGN KEY(player_id) REFERENCES player(id),
CONSTRAINT wicket_fk FOREIGN KEY(fielder_id) REFERENCES player(id)
);
-- **Create extratype table**
CREATE TABLE extratype
(
id NUMBER(11),
name VARCHAR(100)NOT NULL,
CONSTRAINT extratype_pk PRIMARY KEY(id)
);
-- **Create extradelivery table**
CREATE TABLE extradelivery
(
id NUMBER(11),
delivery_id NUMBER(11)NOT NULL,
extra_type_id NUMBER(11)NOT NULL,
runs NUMBER(11)NOT NULL,
CONSTRAINT extradelivery_pk PRIMARY KEY(id),
CONSTRAINT extradelivery_fk FOREIGN KEY(delivery_id) REFERENCES delivery(id),
CONSTRAINT extradelivery_fk FOREIGN KEY(extra_type_id) REFERENCES extratype(id)
);
-- **Alter column name id**
ALTER TABLE skill
ADD CONSTRAINT skill_pk PRIMARY KEY(id);
-- **Alter column name city**
ALTER TABLE city
MODIFY name VARCHAR(100)NOT NULL;
-- **Alter column name caption**
ALTER TABLE team
MODIFY captain NUMBER(11)NOT NULL;
-- **Delete column status**
ALTER TABLE outcome
DROP COLUMN status;
-- **Drop table delivery**
DROP TABLE delivery;
-- **Drop table game**
DROP TABLE game;
-- **Alter column name innings_number**
ALTER TABLE innings
ADD innings_number NUMBER(11)NOT NULL;
-- **Alter column name wickets**
ALTER TABLE outcome
MODIFY wickets NUMBER(11);
-- **Drop table extratype**
DROP TABLE extratype;

