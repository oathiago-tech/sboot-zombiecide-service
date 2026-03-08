alter table zombicide.matches
    add column if not exists active_walkers integer not null default 0,
    add column if not exists active_runners integer not null default 0,
    add column if not exists active_faties integer not null default 0,
    add column if not exists active_abomination integer not null default 0;

alter table zombicide.matches
    add constraint ck_matches_active_walkers_non_negative check (active_walkers >= 0);

alter table zombicide.matches
    add constraint ck_matches_active_runners_non_negative check (active_runners >= 0);

alter table zombicide.matches
    add constraint ck_matches_active_faties_non_negative check (active_faties >= 0);

alter table zombicide.matches
    add constraint ck_matches_active_abomination_non_negative check (active_abomination >= 0);