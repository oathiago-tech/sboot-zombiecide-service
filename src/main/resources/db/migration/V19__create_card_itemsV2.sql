-- =========================================================
-- V18 - CREATE CARD ITEMS (TAGS + ITEMS)
-- =========================================================
-- PEIXEIRA - Tag: 0486CFAE6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'AZAR', 'Azar')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '046B36AD6F2681',
       'ITEMS_CARD',
       i.id,
       null,
       null,
       null,
       true
from inserted_item i on conflict (tag_uid) do
update
    set tag_type = excluded.tag_type,
    item_id = excluded.item_id,
    player_character = excluded.player_character,
    zombie_type = excluded.zombie_type,
    zombie_id = excluded.zombie_id,
    active = excluded.active;