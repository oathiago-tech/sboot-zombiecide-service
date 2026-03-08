-- =========================================================
-- ENTRY SPAWN - Tag: 537352B9201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_537352B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '537352B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '537352B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53751CB9201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53751CB9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53751CB9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53751CB9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'FATIES'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 5368CCB8201
-- BLUE = 0 (mantendo linha com amount=0)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5368CCB8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5368CCB8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5368CCB8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 0, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'FATIES'),
        ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 5358DB9201
-- ATENÇÃO: você mandou esse tagId 2x com valores diferentes.
-- Escolha UMA das opções abaixo (ou me passe o tagId correto do segundo card).
-- =========================================================

-- OPÇÃO A (orange = 2 faties)
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5358DB9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5358DB9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5358DB9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 0, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'FATIES'),
        ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- OPÇÃO B (orange = 2 runners) -> NÃO pode coexistir com a opção A no mesmo tagId
-- with inserted_zombie as (
--     insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
--     values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5358DB9201')
--     returning id
-- )
-- insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
-- select gen_random_uuid(), '5358DB9201', 'ZOMBIE_CARD', z.id, true
-- from inserted_zombie z;
--
-- with z as (
--     select t.zombie_id as id
--     from zombicide.tags t
--     where t.tag_uid = '5358DB9201'
-- )
-- insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
-- select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
-- from z
-- cross join (
--     values
--         ('BLUE',   'SPAWN_AT_ENTRY', 0, 0, 'WALKERS'),
--         ('YELLOW', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
--         ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
--         ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
-- ) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 533415B9201
-- BLUE = 0 (mantendo linha com amount=0)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_533415B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '533415B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '533415B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 0, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 5328A8B8201
-- BLUE = 0 (mantendo linha com amount=0)
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5328A8B8201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5328A8B8201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5328A8B8201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 0, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53F738B9201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53F738B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53F738B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53F738B9201'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'FATIES'),
        ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- ENTRY SPAWN - Tag: 53E593B9201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53E593B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53E593B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53E593B9201'
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
-- ENTRY SPAWN - Tag: 53E6B5B9201
-- =========================================================
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53E6B5B9201')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53E6B5B9201', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53E6B5B9201'
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