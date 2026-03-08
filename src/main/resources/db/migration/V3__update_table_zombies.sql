alter table zombicide.zombies
drop
column if exists type;

alter table zombicide.zombies
drop
column if exists amount;

alter table zombicide.zombies
    add column if not exists name varchar (255);

alter table zombicide.zombies
    add column if not exists danger_level varchar (50);

alter table zombicide.zombies
    add column if not exists card_effect_type varchar (50);

alter table zombicide.zombies
    add column if not exists key varchar (50);

alter table zombicide.zombies
    alter column name set not null;

alter table zombicide.zombies
    alter column danger_level set not null;

alter table zombicide.zombies
    alter column card_effect_type set not null;

alter table zombicide.zombies
    alter column key set not null;

create table if not exists zombicide.zombie_respawns
(
    id
    uuid
    primary
    key,
    zombie_id
    uuid
    not
    null,
    danger_level
    varchar
(
    50
) not null,
    spawn_point_type varchar
(
    50
) not null,
    amount integer not null,
    execution_order integer not null,
    type varchar
(
    50
) not null,
    constraint fk_zombie_respawns_zombie_id
    foreign key
(
    zombie_id
)
    references zombicide.zombies
(
    id
)
    on delete cascade
    );

create index if not exists ix_zombie_respawns_zombie_id
    on zombicide.zombie_respawns (zombie_id);

create index if not exists ix_zombie_respawns_zombie_id_danger
    on zombicide.zombie_respawns (zombie_id, danger_level);