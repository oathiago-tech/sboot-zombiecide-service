-- =========================================================
-- ENTRY SPAWN - Tag: 53F26B9201
-- spawn_point_type: SPAWN_AT_ENTRY
-- execution_order: 0 (sempre)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53F26B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53F26B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53F26B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 6, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 1, 0, 'FATIES')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 5349DDB8201
-- spawn_point_type: SPAWN_AT_ENTRY
-- execution_order: 0 (sempre)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5349DDB8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5349DDB8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5349DDB8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 2, 0, 'FATIES')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 5350A6B9201
-- spawn_point_type: SPAWN_AT_ENTRY
-- execution_order: 0 (sempre)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5350A6B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5350A6B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5350A6B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 2, 0, 'FATIES')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 531DF8B8201
-- spawn_point_type: SPAWN_AT_ENTRY
-- execution_order: 0 (sempre)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_531DF8B8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '531DF8B8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '531DF8B8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53E29CBA201
-- spawn_point_type: SPAWN_AT_ENTRY
-- execution_order: 0 (sempre)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53E29CBA201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53E29CBA201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53E29CBA201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);