INSERT INTO zombicide.tags (tag_uid, tag_type, player_character, zombie_type, item_id, zombie_id, active)
VALUES
    ('53E674B8020001', 'ZOMBIE', NULL, 'WALKERS', NULL, NULL, TRUE),
    ('539064B8020001', 'ZOMBIE', NULL, 'RUNNERS', NULL, NULL, TRUE),
    ('53946BB8020001', 'ZOMBIE', NULL, 'FATIES',  NULL, NULL, TRUE)
    ON CONFLICT (tag_uid) DO UPDATE
                                 SET tag_type         = EXCLUDED.tag_type,
                                 player_character = EXCLUDED.player_character,
                                 zombie_type      = EXCLUDED.zombie_type,
                                 item_id          = EXCLUDED.item_id,
                                 zombie_id        = EXCLUDED.zombie_id,
                                 active           = EXCLUDED.active;