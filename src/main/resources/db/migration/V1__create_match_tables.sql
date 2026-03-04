CREATE TABLE zombicide.matches
(
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    campaign_name VARCHAR(255) NOT NULL,
    difficult     VARCHAR(50)  NOT NULL,
    active        BOOLEAN      NOT NULL DEFAULT FALSE
);

CREATE TABLE zombicide.match_players
(
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    match_id         UUID         NOT NULL,
    player_name      VARCHAR(255) NOT NULL,
    player_character VARCHAR(255) NOT NULL,
    CONSTRAINT fk_match_players_match
        FOREIGN KEY (match_id) REFERENCES zombicide.matches (id)
            ON DELETE CASCADE
);

CREATE INDEX idx_match_players_match_id ON zombicide.match_players (match_id);