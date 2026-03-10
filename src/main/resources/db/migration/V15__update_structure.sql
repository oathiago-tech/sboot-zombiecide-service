-- 1) Para diferenciar qual PLAYER a tag representa
ALTER TABLE zombicide.tags
    ADD COLUMN IF NOT EXISTS player_character varchar(255);

-- 2) Para diferenciar qual ZUMBI (miniatura) a tag representa
ALTER TABLE zombicide.tags
    ADD COLUMN IF NOT EXISTS zombie_type varchar(50);

-- 3) Necessário pro ON CONFLICT (tag_uid) funcionar
CREATE UNIQUE INDEX IF NOT EXISTS uk_tags_tag_uid
    ON zombicide.tags (tag_uid);

-- 4) Atualiza o CHECK para considerar PLAYER e ZOMBIE (miniatura) sem depender de zombie_id
ALTER TABLE zombicide.tags
DROP CONSTRAINT IF EXISTS ck_tags_exactly_one_target;

ALTER TABLE zombicide.tags
    ADD CONSTRAINT ck_tags_exactly_one_target
        CHECK (
            (
                tag_type = 'PLAYER'
                    AND player_character IS NOT NULL
                    AND zombie_type IS NULL
                    AND item_id IS NULL
                    AND zombie_id IS NULL
                )
                OR
            (
                tag_type = 'ZOMBIE' -- miniatura
                    AND zombie_type IS NOT NULL
                    AND player_character IS NULL
                    AND item_id IS NULL
                    AND zombie_id IS NULL
                )
                OR
            (
                tag_type = 'ZOMBIE_CARD' -- carta
                    AND zombie_id IS NOT NULL
                    AND player_character IS NULL
                    AND zombie_type IS NULL
                    AND item_id IS NULL
                )
                OR
            (
                tag_type IN ('ITEMS_CARD', 'MISSION_OBJECTIVE')
                    AND item_id IS NOT NULL
                    AND player_character IS NULL
                    AND zombie_type IS NULL
                    AND zombie_id IS NULL
                )
            );