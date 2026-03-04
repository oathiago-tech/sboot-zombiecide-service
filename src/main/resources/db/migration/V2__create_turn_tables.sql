CREATE TYPE zombicide.turn_phase AS ENUM ('PLAYER', 'ZOMBIE');

ALTER TABLE zombicide.matches
    ADD COLUMN IF NOT EXISTS turn_phase zombicide.turn_phase NOT NULL DEFAULT 'PLAYER',
    ADD COLUMN IF NOT EXISTS current_turn_index INTEGER NOT NULL DEFAULT 0;

ALTER TABLE zombicide.matches
    ADD CONSTRAINT ck_matches_current_turn_index_non_negative
        CHECK (current_turn_index >= 0);