create schema if not exists GAME authorization postgres;

create table worlds (
	name text primary KEY,
	environment varchar(20)
);

insert into worlds (name, environment) 
values
('Arrakis', 'Desert'),
('Ceayoriel', 'Space'),
('Piheavion', 'Water'),
('Gruxunet', 'Jungle');



create table weapons (
weapon_name text primary key,
weapon_type text,
world_name text,
weapon_power int,
max_ammo int
);


insert into weapons (weapon_name, weapon_type, world_name, weapon_power, max_ammo)
values
('Barbaric Focus', 'Special', 'Arrakis', 42, 100),
('Thunderstrike', 'Range Weapon', 'Piheavion', 35, 100),
('Blightspore', 'Throwable', 'Gruxunet', 78, 100),
('Phantom', 'One-handed', 'Ceayoriel', 45, 100);

insert into weapons (weapon_name, weapon_type, world_name, weapon_power, max_ammo)
values
('Sword of the Blue Storm', 'Two-Handed', 'Piheavion', 60, null);

create table missions (
 mission_name text primary key,
mission_type varchar(15),
world_name text,
reward text
);

insert into missions (mission_name, mission_type, world_name, reward)
values
('Rescue the Princess', 'Rescue', 'Ceayoriel', 'A Kiss'), 
('Project Storm of Blue Scream', 'Fetch', 'Piheavion', 'Sword of the Blue Storm'),
('Project Hunt of the Lion', 'Hunt', 'Gruxunet', 'Barbaric Focus'),
('Project Sand Hand', 'Fetch', 'Arrakis', 'spice');



create TABLE enemies_friendlies (
 npc_name varchar(20) PRIMARY KEY
,world_name text
,species varchar(20)
,npc_size varchar(5)
,npc_health int
,isFriendly boolean
,amount_of_damage int
);

insert into enemies_friendlies (npc_name,world_name,species,npc_size,npc_health,isFriendly,amount_of_damage)
values
 ('Shai-Hulud','Arrakis','The Night Sunds','XXS',10,false,1)
,('Mingtoh','Gruxunet','Tin','XL',75,false,40)
,('Bob','Piheavion','Human','M',9001,true,25)
,('Galadriel','Ceayoriel','Gidnel','S',25,true,5)
,('Kai','Gruxunet','Kepal','XXL',200,true,100)
,('Bort','Piheavion','Iorurly','XXL',200,false,50)
;

create table player (
 player_name varchar(24) primary key
,health int
,equipped_weapon text
,FOREIGN KEY(equipped_weapon) REFERENCES weapons(weapon_name)
,current_location text
,FOREIGN KEY(current_location) REFERENCES worlds(name)
);

insert into player (player_name,health,equipped_weapon,current_location)
values
 ('RG',3000,'Phantom','Piheavion')
,('Branden',3001,'Barbaric Focus','Arrakis')
,('Kayla',3002,'Blightspore','Gruxunet')
;

create table inventory_weapon (
 weapon_name text
,FOREIGN KEY(weapon_name) REFERENCES weapons(weapon_name)
,current_ammo int
);


ALTER TABLE inventory_weapon
add
 player_name varchar(24)
,add 
 foreign key(player_name) references player(player_name)
;

insert into inventory_weapon (weapon_name,current_ammo,player_name)
values
 ('Phantom',100,'RG')
,('Barbaric Focus',100,'Branden')
,('Blightspore',100,'Kayla')
;


