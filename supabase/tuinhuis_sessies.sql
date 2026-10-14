-- Tabel voor sessies van tuinhuis-calculator.html
-- Plak dit in Supabase > SQL Editor.

create table if not exists public.tuinhuis_sessies (
  id bigint generated always as identity primary key,
  aangemaakt timestamptz not null default now(),
  sessie_id text not null check (char_length(sessie_id) <= 64),
  gebeurtenis text not null check (gebeurtenis in ('wijziging','bron_geopend','bron_link_geklikt','contact')),
  scenario text,
  prijsmodel text,
  invoer jsonb,
  resultaat jsonb,
  bronnen_geopend jsonb,
  seconden_op_pagina int,
  email text check (email is null or (char_length(email) <= 254 and toestemming)),
  toestemming boolean not null default false,
  constraint grootte_invoer check (pg_column_size(invoer) < 4000 and pg_column_size(resultaat) < 2000 and pg_column_size(bronnen_geopend) < 2000)
);

create index if not exists tuinhuis_sessies_sessie on public.tuinhuis_sessies (sessie_id, aangemaakt);

alter table public.tuinhuis_sessies enable row level security;

-- Bezoekers (anon) mogen alleen toevoegen. Lezen, wijzigen en verwijderen kan alleen jij via het dashboard.
drop policy if exists "anon mag invoegen" on public.tuinhuis_sessies;
create policy "anon mag invoegen" on public.tuinhuis_sessies
  for insert to anon with check (true);

-- Handig overzicht: een regel per sessie met de laatste stand.
create or replace view public.tuinhuis_laatste_stand as
select distinct on (sessie_id)
  sessie_id, aangemaakt, scenario, prijsmodel, invoer, resultaat, bronnen_geopend, seconden_op_pagina, email
from public.tuinhuis_sessies
order by sessie_id, aangemaakt desc;
