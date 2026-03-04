CREATE SCHEMA IF NOT EXISTS zombicide;
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE zombicide.matches
(
    id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    campaign_name  VARCHAR(255) NOT NULL,
    difficulty     VARCHAR(50)  NOT NULL,
    active         BOOLEAN      NOT NULL DEFAULT FALSE,
    created_at     TIMESTAMPTZ  NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS ux_matches_one_active
    ON zombicide.matches (active)
    WHERE active = TRUE;

CREATE TABLE zombicide.match_players
(
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id         UUID         NOT NULL,
    player_name      VARCHAR(255) NOT NULL,
    player_character VARCHAR(255) NOT NULL,
    player_life      INTEGER      NOT NULL DEFAULT 3 CHECK (player_life >= 0),
    player_level     INTEGER      NOT NULL DEFAULT 0 CHECK (player_level >= 0),
    zombies_kill     INTEGER      NOT NULL DEFAULT 0 CHECK (zombies_kill >= 0),

    CONSTRAINT fk_match_players_match
        FOREIGN KEY (match_id) REFERENCES zombicide.matches (id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_match_players_match_id
    ON zombicide.match_players (match_id);

CREATE TABLE zombicide.items
(
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    item_name        VARCHAR(255) NOT NULL,
    item_description TEXT         NOT NULL
);

CREATE TABLE zombicide.zombies
(
    id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50)  NOT NULL
);

CREATE TABLE IF NOT EXISTS zombicide.tags
(
    id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tag_uid  VARCHAR(255) NOT NULL UNIQUE,      -- UID real da tag NFC
    tag_type VARCHAR(50)  NOT NULL,             -- ex: ITEM_CARD, ZOMBIE_CARD
    item_id  UUID,
    zombie_id UUID,
    active   BOOLEAN      NOT NULL DEFAULT TRUE,

    CONSTRAINT fk_tags_item
    FOREIGN KEY (item_id) REFERENCES zombicide.items (id),
    CONSTRAINT fk_tags_zombie
    FOREIGN KEY (zombie_id) REFERENCES zombicide.zombies (id),

    -- Garante que a tag aponte para exatamente um tipo de carta
    CONSTRAINT ck_tags_exactly_one_target
    CHECK (
(item_id IS NOT NULL AND zombie_id IS NULL)
    OR
(item_id IS NULL AND zombie_id IS NOT NULL)
    )
    );

-- Inventário: itens por jogador da partida
CREATE TABLE zombicide.match_player_items
(
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_player_id UUID NOT NULL,
    item_id         UUID NOT NULL,
    acquired_at     TIMESTAMPTZ NOT NULL DEFAULT now(),

    CONSTRAINT fk_mpi_player
        FOREIGN KEY (match_player_id) REFERENCES zombicide.match_players (id) ON DELETE CASCADE,
    CONSTRAINT fk_mpi_item
        FOREIGN KEY (item_id) REFERENCES zombicide.items (id),

    CONSTRAINT ux_mpi_unique_item_per_player
        UNIQUE (match_player_id, item_id)
);

CREATE INDEX IF NOT EXISTS idx_mpi_player
    ON zombicide.match_player_items (match_player_id);

CREATE TABLE zombicide.match_events
(
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id   UUID NOT NULL,
    actor_match_player_id UUID,
    event_type VARCHAR(50) NOT NULL,
    tag_uid    VARCHAR(255),
    payload    JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),

    CONSTRAINT fk_events_match
        FOREIGN KEY (match_id) REFERENCES zombicide.matches (id) ON DELETE CASCADE,
    CONSTRAINT fk_events_actor
        FOREIGN KEY (actor_match_player_id) REFERENCES zombicide.match_players (id) ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS idx_events_match_created_at
    ON zombicide.match_events (match_id, created_at);