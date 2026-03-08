-- =========================================================
-- ENTRY SPAWN - Tag: 532BC0B8201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_532BC0B8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '532BC0B8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '532BC0B8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53D883B9201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53D883B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53D883B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53D883B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53AA3FB9201
-- (você enviou esse tagId duplicado; mantendo apenas 1 cadastro)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53AA3FB9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53AA3FB9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53AA3FB9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 3, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 5, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 3, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53FC8B9201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53FC8B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53FC8B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53FC8B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 3, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 4, 0, 'FATIES')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53D2F0B8201
-- (yellow = 1 runneres -> 1 RUNNERS)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53D2F0B8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53D2F0B8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53D2F0B8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 4, 0, 'FATIES')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 5334C1B9201
-- (yellow = 1 runneres -> 1 RUNNERS)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5334C1B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5334C1B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5334C1B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 4, 0, 'FATIES')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53F1B8B8201
-- (yellow = 1 runneres -> 1 RUNNERS)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53F1B8B8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53F1B8B8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53F1B8B8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('RED',    'SPAWN_AT_ENTRY', 4, 0, 'FATIES')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53E17CB9201
-- ATENÇÃO: você mandou esse tagId 2x com valores diferentes.
-- Escolha UMA das opções abaixo (ou me passe o tagId correto do segundo card).
-- =========================================================

-- OPÇÃO A (red = 4 fatties)
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53E17CB9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53E17CB9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53E17CB9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('RED',    'SPAWN_AT_ENTRY', 4, 0, 'FATIES')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- OPÇÃO B (red = 4 runners) -> NÃO pode coexistir com a opção A no mesmo tagId
-- (se for esse card, remova a opção A acima ou altere o tagId)
-- with inserted_zombie as (
--     insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
--     values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53E17CB9201')
--     returning id
-- )
-- insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
-- select gen_random_uuid(), '53E17CB9201', 'ZOMBIE_CARD', z.id, true
-- from inserted_zombie z;
--
-- with z as (
--     select t.zombie_id as id
--     from zombicide.tags t
--     where t.tag_uid = '53E17CB9201'
-- )
-- insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
-- select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
-- from z
-- cross join (
--     values
--         ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
--         ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
--         ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
--         ('RED',    'SPAWN_AT_ENTRY', 4, 0, 'RUNNERS')
-- ) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 537D9FB9201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_537D9FB9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '537D9FB9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '537D9FB9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 4, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);