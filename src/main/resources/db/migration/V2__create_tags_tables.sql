CREATE SCHEMA IF NOT EXISTS zombicide;

CREATE TABLE IF NOT EXISTS zombicide.tags (
                                              id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tag_id      VARCHAR(255) NOT NULL,
    tag_type    VARCHAR(50)  NOT NULL,
    zombie_type VARCHAR(50)  NOT NULL,
    value       VARCHAR(100) NOT NULL,
    active      BOOLEAN
    );

ALTER TABLE zombicide.tags
    ADD CONSTRAINT chk_tags_tag_type
        CHECK (tag_type IN ('PLAYER', 'ZOMBIE', 'ZOMBIE_CARD', 'ITEMS_CARD'));

ALTER TABLE zombicide.tags
    ADD CONSTRAINT chk_tags_zombie_type
        CHECK (zombie_type IN ('PLAYER', 'ZOMBIE', 'ZOMBIE_CARD', 'ITEMS_CARD'));
