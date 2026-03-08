-- =========================================================
-- ENTRY SPAWN - Tag: 535BAFB8201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_535BAFB8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '535BAFB8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '535BAFB8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 6, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 7, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53F71B9201
-- ATENÇÃO: tagId duplicado com valores diferentes. Escolha UMA opção.
-- =========================================================

-- OPÇÃO A (orange = 6 walkers)
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53F71B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53F71B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53F71B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 6, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 7, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- OPÇÃO B (orange = 3 walkers) -> NÃO pode coexistir com a opção A no mesmo tagId
-- with inserted_zombie as (
--     insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
--     values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53F71B9201')
--     returning id
-- )
-- insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
-- select gen_random_uuid(), '53F71B9201', 'ZOMBIE_CARD', z.id, true
-- from inserted_zombie z;
--
-- with z as (
--     select t.zombie_id as id
--     from zombicide.tags t
--     where t.tag_uid = '53F71B9201'
-- )
-- insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
-- select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
-- from z
-- cross join (
--     values
--         ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
--         ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
--         ('ORANGE', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
--         ('RED',    'SPAWN_AT_ENTRY', 7, 0, 'WALKERS')
-- ) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 536446B9201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_536446B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '536446B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '536446B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 3, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 7, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 533632B9201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_533632B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '533632B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '533632B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 8, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53F87BB8201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53F87BB8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53F87BB8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53F87BB8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 3, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 7, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53F387B8201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53F387B8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53F387B8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53F387B8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 3, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 7, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 538598B8201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_538598B8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '538598B8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '538598B8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 4, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53BD9EB8201
-- (yellow = 2 runnres -> 2 RUNNERS)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53BD9EB8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53BD9EB8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53BD9EB8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 5, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 3, 0, 'FATIES')
) as r(danger_level, spawn_point_type, amount, execution_order, type);