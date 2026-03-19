INSERT INTO zombicide.tags (
    id,
    tag_uid,
    tag_type,
    active,
    zombie_type,
    name,
    life
)
VALUES
    (gen_random_uuid(), '04B635AD6F2681', 'ZOMBIE', true, 'FATIES', 'Fatie', 1),
    (gen_random_uuid(), '041C36AD6F2681', 'ZOMBIE', true, 'FATIES', 'Fatie', 1),
    (gen_random_uuid(), '04C735AD6F2681', 'ZOMBIE', true, 'FATIES', 'Fatie', 1),
    (gen_random_uuid(), '53946BB8020001', 'ZOMBIE', true, 'FATIES', 'Fatie', 1),
    (gen_random_uuid(), '04BE35AD6F2681', 'ZOMBIE', true, 'FATIES', 'Fatie', 1);