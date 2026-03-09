begin;

create
extension if not exists pgcrypto;

-- =========================================================
-- WALKERS - Tag: 538F59B9020001
-- =========================================================
with inserted_zombie as (
insert
into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'worsen', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'WALKERS_WORSEN_CARD')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '538F59B9020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (select t.zombie_id as id
           from zombicide.tags t
           where t.tag_uid = '538F59B9020001')
insert
into zombicide.zombie_respawns (id, zombie_id, danger_level, spawn_point_type, amount, execution_order, type)
select gen_random_uuid(), z.id, r.danger_level, r.spawn_point_type, r.amount, r.execution_order, r.type
from z
         cross join (values ('YELLOW', 'EXTRA_ZOMBIE_TURN', 0, 0, 'WALKERS'),
                            ('ORANGE', 'EXTRA_ZOMBIE_TURN', 0, 0, 'WALKERS'),
                            ('RED', 'EXTRA_ZOMBIE_TURN', 0, 0,
                             'WALKERS')) as r(danger_level, spawn_point_type, amount, execution_order, type);


-- ---------------------------------------------------------
-- ENTRY SPAWN - Tag: 5328A8B8020001
-- BLUE 0, YELLOW 2R, ORANGE 2R, RED 5W
-- spawn_point_type=SPAWN_AT_ENTRY, execution_order=0
-- ---------------------------------------------------------
with inserted_zombie as (
insert into zombicide.zombies (id, name, danger_level, card_effect_type, key)
values (gen_random_uuid(), 'entry_spawn', 'BLUE', 'EXTRA_ZOMBIE_TURN', 'ENTRY_SPAWN_5328A8B8020001')
    returning id
    )
insert into zombicide.tags (id, tag_uid, tag_type, zombie_id, active)
select gen_random_uuid(), '5328A8B8020001', 'ZOMBIE_CARD', z.id, true
from inserted_zombie z;

with z as (
    select t.zombie_id as id
    from zombicide.tags t
    where t.tag_uid = '5328A8B8020001'
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

commit;