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
    (gen_random_uuid(), '041D36AD6F2681', 'ZOMBIE', true, 'ABOMINATION', 'Abomination', 1);