-- =========================================================
-- V18 - CREATE CARD ITEMS (TAGS + ITEMS)
-- =========================================================
-- PEIXEIRA - Tag: 0486CFAE6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'PEIXEIRA', 'Peixeira')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '0486CFAE6F2681',
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

-- =========================================================
-- SERRA - Tag: 049B36AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'SERRA', 'Serra')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '049B36AD6F2681',
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

-- =========================================================
-- KATANA - Tag: 049636AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'KATANA', 'Katana')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '049636AD6F2681',
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

-- =========================================================
-- SERRADO - Tag: 049536AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'SERRADO', 'Serrado')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '049536AD6F2681',
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

-- =========================================================
-- AUTOMATICAS - Tag: 04AD36AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'AUTOMATICAS', 'Automaticas')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '04AD36AD6F2681',
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

-- =========================================================
-- PISTOLA - Tag: 04A636AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'PISTOLA', 'Pistola')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '04A636AD6F2681',
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

-- =========================================================
-- ESPINGARDA - Tag: 04A536AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'ESPINGARDA', 'Espingarda')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '04A536AD6F2681',
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

-- =========================================================
-- MUNICAO - Tag: 04A436AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'MUNICAO', 'Municao')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '04A436AD6F2681',
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

-- =========================================================
-- AGUA - Tag: 049E36AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'AGUA', 'Agua')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '049E36AD6F2681',
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

-- =========================================================
-- MASCARA - Tag: 048A36AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'MASCARA', 'Mascara')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '048A36AD6F2681',
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

-- =========================================================
-- GASOLINA - Tag: 048536AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'GASOLINA', 'Gasolina')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '048536AD6F2681',
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

-- =========================================================
-- BAIONETA - Tag: 048436AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'BAIONETA', 'Baioneta')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '048436AD6F2681',
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

-- =========================================================
-- MACHADO - Tag: 048336AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'MACHADO', 'Machado')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '048336AD6F2681',
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

-- =========================================================
-- BASTAO - Tag: 048236AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'BASTAO', 'Bastao')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '048236AD6F2681',
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

-- =========================================================
-- GARRAFA - Tag: 049436AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'GARRAFA', 'Garrafa')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '049436AD6F2681',
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

-- =========================================================
-- COMIDA - Tag: 049336AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'COMIDA', 'Comida')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '049336AD6F2681',
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

-- =========================================================
-- PANELA - Tag: 048D36AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'PANELA', 'Panela')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '048D36AD6F2681',
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

-- =========================================================
-- RIFLE - Tag: 048C36AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'RIFLE', 'Rifle')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '048C36AD6F2681',
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

-- =========================================================
-- PE - Tag: 048B36AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'PE', 'Pe')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '048B36AD6F2681',
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

-- =========================================================
-- LANTERNA - Tag: 047336AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'LANTERNA', 'Lanterna')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '047336AD6F2681',
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

-- =========================================================
-- LUNETA - Tag: 047236AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'LUNETA', 'Luneta')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '047236AD6F2681',
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

-- =========================================================
-- PERIGO - Tag: 047136AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'PERIGO', 'Perigo')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '047136AD6F2681',
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

-- =========================================================
-- MOLOTOV - Tag: 049D36AD6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'MOLOTOV', 'Molotov')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '049D36AD6F2681',
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

-- =========================================================
-- GEMEAS - Tag: 0485CFAE6F2681
-- =========================================================
with inserted_item as (
insert
into zombicide.items (id, item_name, item_description)
values (gen_random_uuid(), 'GEMEAS', 'Gemeas')
    returning id
    )
insert
into zombicide.tags (id, tag_uid, tag_type, item_id, player_character, zombie_type, zombie_id, active)
select gen_random_uuid(),
       '0485CFAE6F2681',
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