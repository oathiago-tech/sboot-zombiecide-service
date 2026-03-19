INSERT INTO zombicide.tags (
    id,
    tag_uid,
    tag_type,
    active,
    player_character,
    name,
    life
)
VALUES
    (gen_random_uuid(), '041536AD6F2681', 'PLAYER', true, 'NED', 'Ned', 2),
    (gen_random_uuid(), '53C358B8020001', 'PLAYER', true, 'AMY', 'Amy', 2),
    (gen_random_uuid(), '53E341B8020001', 'PLAYER', true, 'JOSH', 'Josh', 2),
    (gen_random_uuid(), '53C048B8020001', 'PLAYER', true, 'DOUG', 'Doug', 2);