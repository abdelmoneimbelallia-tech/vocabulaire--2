-- À exécuter dans Supabase > SQL Editor > New query
create table if not exists public.user_vocabulary_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{"words": [], "log": {}}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.user_vocabulary_data enable row level security;

drop policy if exists "Users can read their own vocabulary" on public.user_vocabulary_data;
create policy "Users can read their own vocabulary"
on public.user_vocabulary_data for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can insert their own vocabulary" on public.user_vocabulary_data;
create policy "Users can insert their own vocabulary"
on public.user_vocabulary_data for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update their own vocabulary" on public.user_vocabulary_data;
create policy "Users can update their own vocabulary"
on public.user_vocabulary_data for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);
