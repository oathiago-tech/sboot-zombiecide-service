begin;

create
extension if not exists pgcrypto;

-- =========================================================
-- FATIES - Tag: 53C3C7B9020001
-- =========================================================
with inserted_zombie as (
insert
into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'worsen', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'FATIES_WORSEN_CARD')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53C3C7B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (select t.zombie_id as id
           from zombicide.tags t
           where t.tag_uid = '53C3C7B9020001')
insert
into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (values ('YELLOW', 'EXTRA_ZOMBIE_TURN', 0, 0, 'FATIES'),
                            ('ORANGE', 'EXTRA_ZOMBIE_TURN', 0, 0, 'FATIES'),
                            ('RED', 'EXTRA_ZOMBIE_TURN', 0, 0,
                             'FATIES')) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- RUNNERS - Tag: 5356CFB9020001
-- =========================================================
with inserted_zombie as (
insert
into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'worsen', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'RUNNERS_WORSEN_CARD')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5356CFB9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (select t.zombie_id as id
           from zombicide.tags t
           where t.tag_uid = '5356CFB9020001')
insert
into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (values ('YELLOW', 'EXTRA_ZOMBIE_TURN', 0, 0, 'RUNNERS'),
                            ('ORANGE', 'EXTRA_ZOMBIE_TURN', 0, 0, 'RUNNERS'),
                            ('RED', 'EXTRA_ZOMBIE_TURN', 0, 0,
                             'RUNNERS')) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- =========================================================
-- WALKERS - Tag: 53F562B9020001
-- =========================================================
with inserted_zombie as (
insert
into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'worsen', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'WALKERS_WORSEN_CARD')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53F562B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (select t.zombie_id as id
           from zombicide.tags t
           where t.tag_uid = '53F562B9020001')
insert
into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (values ('YELLOW', 'EXTRA_ZOMBIE_TURN', 0, 0, 'WALKERS'),
                            ('ORANGE', 'EXTRA_ZOMBIE_TURN', 0, 0, 'WALKERS'),
                            ('RED', 'EXTRA_ZOMBIE_TURN', 0, 0,
                             'WALKERS')) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- ---------------------------------------------------------
-- SEWER SPAWN - Tag: 53DCDDB9020001
-- BLUE 1W, YELLOW 1R, ORANGE 2W, RED 1F
-- spawn_point_type=SPAWN_AT_SEWER, execution_order=0
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'sewer_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'SEWER_SPAWN_53DCDDB9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '53DCDDB9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '53DCDDB9020001'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_SEWER', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_SEWER', 1, 0, 'RUNNERS'),
        ('ORANGE', 'SPAWN_AT_SEWER', 2, 0, 'WALKERS'),
        ('RED',    'SPAWN_AT_SEWER', 1, 0, 'FATIES')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

-- ---------------------------------------------------------
-- SEWER SPAWN - Tag: 537DD3B9020001
-- BLUE 1W, YELLOW 2W, ORANGE 1F, RED 1R
-- spawn_point_type=SPAWN_AT_SEWER, execution_order=0
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'sewer_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'SEWER_SPAWN_537DD3B9020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '537DD3B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '537DD3B9020001'
)
insert into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (
    values
        ('BLUE',   'SPAWN_AT_SEWER', 1, 0, 'WALKERS'),
        ('YELLOW', 'SPAWN_AT_SEWER', 2, 0, 'WALKERS'),
        ('ORANGE', 'SPAWN_AT_SEWER', 1, 0, 'FATIES'),
        ('RED',    'SPAWN_AT_SEWER', 1, 0, 'RUNNERS')
) as r(danger_level, spawn_point_type, amount, execution_order, type);

commit;