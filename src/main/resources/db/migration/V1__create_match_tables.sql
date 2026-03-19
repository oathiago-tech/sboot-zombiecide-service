-- 1. Criação do Schema (apenas uma vez)
CREATE SCHEMA IF NOT EXISTS zombicide;

-- 2. Criação dos tipos ENUM Customizados
DO $$
BEGIN
    -- Criação do Enum de turnos
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'turn_phase' AND typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'zombicide')) THEN
CREATE TYPE zombicide.turn_phase AS ENUM ('PLAYER', 'ZOMBIE');
END IF;

    -- Criação do Enum de eventos
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'event_type' AND typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'zombicide')) THEN
CREATE TYPE zombicide.event_type AS ENUM (
            'DAMAGE_ASSIGNED', 'DAMAGE_REVERTED', 'ITEM_SCANNED',
            'TURN_ENDED', 'TURN_STARTED', 'ZOMBIE_CARD_SCANNED',
            'ZOMBIE_EXTRA_TURN', 'ZOMBIE_KILL', 'ZOMBIE_SCANNED'
        );
END IF;
END $$;


-- 3. Criação da Tabela Matches
CREATE TABLE zombicide.matches
(
    id                 UUID PRIMARY KEY,
    campaign_name      VARCHAR(255)             NOT NULL,
    difficulty         VARCHAR(50)              NOT NULL,
    active             BOOLEAN                  NOT NULL DEFAULT FALSE,
    created_at         TIMESTAMP WITH TIME ZONE NOT NULL,
    turn_phase         zombicide.turn_phase     NOT NULL DEFAULT 'PLAYER',
    current_turn_index INTEGER                  NOT NULL DEFAULT 0,
    active_walkers     INTEGER                  NOT NULL DEFAULT 0,
    active_runners     INTEGER                  NOT NULL DEFAULT 0,
    active_faties      INTEGER                  NOT NULL DEFAULT 0,
    active_abomination INTEGER                  NOT NULL DEFAULT 0,
    automatic_spawn    BOOLEAN,
    spawns_amount      INTEGER
);

CREATE UNIQUE INDEX IF NOT EXISTS ux_matches_one_active
    ON zombicide.matches (active)
    WHERE active = TRUE;


-- 4. Criação da Tabela Match Players
CREATE TABLE zombicide.match_players
(
    id               UUID PRIMARY KEY,
    match_id         UUID         NOT NULL,
    player_name      VARCHAR(255) NOT NULL,
    player_character VARCHAR(255) NOT NULL,
    player_life      INTEGER      NOT NULL DEFAULT 3, -- Corrigido de 2 para 3 conforme entidade
    player_level     INTEGER      NOT NULL DEFAULT 0,
    zombies_kill     INTEGER      NOT NULL DEFAULT 0,
    objectives       INTEGER      NOT NULL DEFAULT 0,

    CONSTRAINT fk_match_players_match_id FOREIGN KEY (match_id) REFERENCES zombicide.matches (id)
);


-- 5. Criação da Tabela Tags
CREATE TABLE zombicide.tags
(
    id                   UUID PRIMARY KEY,
    tag_uid              VARCHAR(255) NOT NULL,
    tag_type             VARCHAR(50)  NOT NULL,
    active               BOOLEAN      NOT NULL DEFAULT TRUE,
    player_character     VARCHAR(255),
    zombie_type          VARCHAR(255),
    name                 VARCHAR(255),
    life                 INTEGER,
    danger_level         INTEGER,     -- Adicionado
    amount_kill          INTEGER,     -- Adicionado
    blue_zombie_amount   INTEGER,
    blue_zombie_type     VARCHAR(255),
    yellow_zombie_amount INTEGER,
    yellow_zombie_type   VARCHAR(255),
    orange_zombie_amount INTEGER,
    orange_zombie_type   VARCHAR(255),
    red_zombie_amount    INTEGER,
    red_zombie_type      VARCHAR(255),
    CONSTRAINT uk_tags_tag_uid UNIQUE (tag_uid)
);


-- 6. Criação da Tabela Match Events
CREATE TABLE zombicide.match_events
(
    id                    UUID PRIMARY KEY     DEFAULT gen_random_uuid(),
    match_id              UUID                 NOT NULL,
    actor_match_player_id UUID,
    event_type            zombicide.event_type NOT NULL, -- Corrigido para usar o enum customizado
    tag_uid               VARCHAR(255),
    payload               JSONB                NOT NULL DEFAULT '{}'::jsonb,
    created_at            TIMESTAMPTZ          NOT NULL DEFAULT now(),

    CONSTRAINT fk_events_match
        FOREIGN KEY (match_id) REFERENCES zombicide.matches (id) ON DELETE CASCADE,
    CONSTRAINT fk_events_actor
        FOREIGN KEY (actor_match_player_id) REFERENCES zombicide.match_players (id) ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS idx_events_match_created_at
    ON zombicide.match_events (match_id, created_at);