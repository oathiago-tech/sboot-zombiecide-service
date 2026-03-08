-- =========================================================
-- ENTRY SPAWN - Tag: 53B91B9201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53B91B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53B91B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53B91B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 7, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53158FB8201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53158FB8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53158FB8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53158FB8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('RED',    'SPAWN_AT_ENTRY', 6, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 538FE4B8201
-- BLUE = 0 (mantendo linha com amount=0)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_538FE4B8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '538FE4B8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '538FE4B8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 0, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 5332AFB9201
-- BLUE = 0 (mantendo linha com amount=0)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5332AFB9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5332AFB9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5332AFB9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 0, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53A8D3B8201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53A8D3B8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53A8D3B8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53A8D3B8201'
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