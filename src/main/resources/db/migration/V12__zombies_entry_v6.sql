-- =========================================================
-- ENTRY SPAWN recadastro (spawn_point_type=SPAWN_AT_ENTRY, execution_order=0)
-- =========================================================

-- ---------------------------------------------------------
-- Tag: 53F87BB8020001
-- BLUE 1W, YELLOW 1W, ORANGE 3R, RED 7W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53F87BB8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53F87BB8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53F87BB8020001'
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

-- ---------------------------------------------------------
-- Tag: 533632B9020001
-- BLUE 1R, YELLOW 1R, ORANGE 3W, RED 8W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_533632B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '533632B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '533632B9020001'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 8, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- ---------------------------------------------------------
-- Tag: 536446B9020001
-- BLUE 1W, YELLOW 2W, ORANGE 3R, RED 7W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_536446B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '536446B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '536446B9020001'
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

-- ---------------------------------------------------------
-- Tag: 530F71B9020001
-- BLUE 1W, YELLOW 1W, ORANGE 6W, RED 7W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_530F71B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '530F71B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '530F71B9020001'
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

-- ---------------------------------------------------------
-- Tag: 535BAFB8020001
-- BLUE 1W, YELLOW 1W, ORANGE 6W, RED 7W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_535BAFB8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '535BAFB8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '535BAFB8020001'
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

-- ---------------------------------------------------------
-- Tag: 53F387B8020001
-- BLUE 1W, YELLOW 1W, ORANGE 3R, RED 7W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53F387B8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53F387B8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53F387B8020001'
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

-- ---------------------------------------------------------
-- Tag: 538598B8020001
-- BLUE 1W, YELLOW 1F, ORANGE 3W, RED 4R
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_538598B8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '538598B8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '538598B8020001'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 4, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- ---------------------------------------------------------
-- Tag: 53BD9EB8020001
-- BLUE 1W, YELLOW 2R, ORANGE 5W, RED 3F
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53BD9EB8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53BD9EB8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53BD9EB8020001'
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

-- ---------------------------------------------------------
-- Tag: 53751CB9020001
-- BLUE 2W, YELLOW 1F, ORANGE 2R, RED 5W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53751CB9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53751CB9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53751CB9020001'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 2, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
        ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- ---------------------------------------------------------
-- Tag: 537352B9020001
-- BLUE 1F, YELLOW 3W, ORANGE 2R, RED 5W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_537352B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '537352B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '537352B9020001'
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

-- ---------------------------------------------------------
-- Tag: 5368CCB8020001
-- BLUE 0, YELLOW 4W, ORANGE 2F, RED 5W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5368CCB8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5368CCB8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5368CCB8020001'
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

-- ---------------------------------------------------------
-- Tag: 53058DB9020001
-- OPÇÃO A: BLUE 0, YELLOW 4W, ORANGE 2F, RED 5W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53058DB9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53058DB9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53058DB9020001'
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

-- OPÇÃO B (NÃO pode coexistir com a opção A com o mesmo tagId):
-- BLUE 0, YELLOW 2R, ORANGE 2R, RED 5W
-- (descomente apenas se esta for a configuração correta e remova a OPÇÃO A acima)
-- with inserted_zombie as (
--     insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
--     values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53058DB9020001')
--     returning id
-- )
-- insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
-- select gen_random_uuid(), '53058DB9020001', 'ZOMBIE_CARD', z.id, true
-- from inserted_zombie z;
--
-- with z as (
--     select t.zombie_id as id
--     from zombicide.tags t
--     where t.tag_uid = '53058DB9020001'
-- )
-- insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
-- select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
-- from z
-- cross join (
--     values
--         ('BLUE',   'SPAWN_AT_ENTRY', 0, 0, 'WALKERS'),
--         ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
--         ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
--         ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
-- ) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- ---------------------------------------------------------
-- Tag: 533415B9020001
-- BLUE 0, YELLOW 2R, ORANGE 2R, RED 5W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_533415B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '533415B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '533415B9020001'
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

-- ---------------------------------------------------------
-- Tag: 53F738B9020001
-- BLUE 1F, YELLOW 3W, ORANGE 2F, RED 5W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53F738B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53F738B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53F738B9020001'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 3, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 2, 0, 'FATIES'),
        ('RED',    'SPAWN_AT_ENTRY', 5, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- ---------------------------------------------------------
-- Tag: 53E593B9020001
-- BLUE 1W, YELLOW 1W, ORANGE 3R, RED 7W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53E593B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53E593B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53E593B9020001'
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

-- ---------------------------------------------------------
-- Tag: 53E6B5B9020001
-- BLUE 1W, YELLOW 1W, ORANGE 3R, RED 7W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53E6B5B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53E6B5B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53E6B5B9020001'
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

-- ---------------------------------------------------------
-- Tag: 53F1B8B8020001
-- BLUE 1W, YELLOW 1R, ORANGE 1F, RED 4R
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53F1B8B8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53F1B8B8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53F1B8B8020001'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('RED',    'SPAWN_AT_ENTRY', 4, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- ---------------------------------------------------------
-- Tag: 53E17CB9020001
-- BLUE 1W, YELLOW 1R, ORANGE 1F, RED 4R
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53E17CB9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53E17CB9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53E17CB9020001'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 1, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('RED',    'SPAWN_AT_ENTRY', 4, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- ---------------------------------------------------------
-- Tag: 537D9FB9020001
-- BLUE 1W, YELLOW 2W, ORANGE 2W, RED 4R
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_537D9FB9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '537D9FB9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '537D9FB9020001'
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

-- ---------------------------------------------------------
-- Tag: 5334C1B9020001
-- BLUE 1W, YELLOW 1R, ORANGE 1R, RED 4F
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5334C1B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5334C1B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5334C1B9020001'
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

-- ---------------------------------------------------------
-- Tag: 53D2F0B8020001
-- BLUE 1W, YELLOW 1R, ORANGE 1R, RED 4F
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53D2F0B8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53D2F0B8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53D2F0B8020001'
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

-- ---------------------------------------------------------
-- Tag: 53FC08B9020001
-- BLUE 2W, YELLOW 2W, ORANGE 3R, RED 4F
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53FC08B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53FC08B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53FC08B9020001'
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

-- ---------------------------------------------------------
-- Tag: 53AA3FB9020001
-- BLUE 1W, YELLOW 2R, ORANGE 5W, RED 3R
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53AA3FB9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53AA3FB9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53AA3FB9020001'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 2, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 5, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_ENTRY', 3, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- ---------------------------------------------------------
-- Tag: 53D883B9020001
-- BLUE 2W, YELLOW 3W, ORANGE 4W, RED 2R
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53D883B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53D883B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53D883B9020001'
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

-- ---------------------------------------------------------
-- Tag: 532BC0B8020001
-- BLUE 2W, YELLOW 3W, ORANGE 4W, RED 2R
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_532BC0B8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '532BC0B8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '532BC0B8020001'
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

-- ---------------------------------------------------------
-- Tag: 53E29CBA020001
-- BLUE 1F, YELLOW 3W, ORANGE 4W, RED 2R
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53E29CBA020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53E29CBA020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53E29CBA020001'
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

-- ---------------------------------------------------------
-- Tag: 531DF8B8020001
-- BLUE 1F, YELLOW 3W, ORANGE 4W, RED 2R
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_531DF8B8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '531DF8B8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '531DF8B8020001'
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

-- ---------------------------------------------------------
-- Tag: 530F26B9020001
-- BLUE 1W, YELLOW 2W, ORANGE 6W, RED 1F
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_530F26B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '530F26B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '530F26B9020001'
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

-- ---------------------------------------------------------
-- Tag: 5349DDB8020001
-- BLUE 2W, YELLOW 3W, ORANGE 4W, RED 2F
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5349DDB8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5349DDB8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5349DDB8020001'
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

-- ---------------------------------------------------------
-- Tag: 5350A6B9020001
-- BLUE 2W, YELLOW 3W, ORANGE 4W, RED 2F
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5350A6B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5350A6B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5350A6B9020001'
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

-- ---------------------------------------------------------
-- Tag: 53A8D3B8020001
-- BLUE 1W, YELLOW 2W, ORANGE 2W, RED 4R
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53A8D3B8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53A8D3B8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53A8D3B8020001'
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

-- ---------------------------------------------------------
-- Tag: 5332AFB9020001
-- BLUE 0, YELLOW 4W, ORANGE 2R, RED 5W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5332AFB9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5332AFB9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5332AFB9020001'
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

-- ---------------------------------------------------------
-- Tag: 538FE4B8020001
-- BLUE 0, YELLOW 4W, ORANGE 2R, RED 5W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_538FE4B8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '538FE4B8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '538FE4B8020001'
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

-- ---------------------------------------------------------
-- Tag: 53158FB8020001
-- BLUE 1W, YELLOW 4W, ORANGE 1F, RED 6W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53158FB8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53158FB8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53158FB8020001'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_ENTRY', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_ENTRY', 4, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_ENTRY', 1, 0, 'FATIES'),
        ('RED',    'SPAWN_AT_ENTRY', 6, 0, 'WALKERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- ---------------------------------------------------------
-- Tag: 53B901B9020001
-- BLUE 1W, YELLOW 2W, ORANGE 3W, RED 7W
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_53B901B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53B901B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53B901B9020001'
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