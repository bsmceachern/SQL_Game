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


create table

create table