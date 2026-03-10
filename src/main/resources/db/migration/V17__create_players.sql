INSERT INTO zombicide.tags (tag_uid, tag_type, player_character, zombie_type, item_id, zombie_id, active)
VALUES
    ('53E341B8020001', 'PLAYER', 'DOUG',  NULL, NULL, NULL, TRUE),
    ('535336B8020001', 'PLAYER', 'WANDA', NULL, NULL, NULL, TRUE),
    ('53C358B8020001', 'PLAYER', 'AMY',   NULL, NULL, NULL, TRUE),
    ('53D051B8020001', 'PLAYER', 'JOSH',  NULL, NULL, NULL, TRUE),
    ('53C048B8020001', 'PLAYER', 'PHIL',  NULL, NULL, NULL, TRUE)
    ON CONFLICT (tag_uid) DO UPDATE
                                 SET tag_type         = EXCLUDED.tag_type,
                                 player_character = EXCLUDED.player_character,
                                 zombie_type      = EXCLUDED.zombie_type,
                                 item_id          = EXCLUDED.item_id,
                                 zombie_id        = EXCLUDED.zombie_id,
                                 active           = EXCLUDED.active;