-- Run in Supabase SQL Editor to support shared reservation editing/deleting
-- and activity resolved dates.

alter table if exists public.activity_feed
  add column if not exists resolved_at timestamptz;

-- Let signed-in users read, create, update, and delete activity rows.
alter table if exists public.activity_feed enable row level security;

drop policy if exists "Authenticated users can read activity" on public.activity_feed;
create policy "Authenticated users can read activity"
on public.activity_feed for select
to authenticated
using (true);

drop policy if exists "Authenticated users can create activity" on public.activity_feed;
create policy "Authenticated users can create activity"
on public.activity_feed for insert
to authenticated
with check (true);

drop policy if exists "Authenticated users can update activity" on public.activity_feed;
create policy "Authenticated users can update activity"
on public.activity_feed for update
to authenticated
using (true)
with check (true);

drop policy if exists "Authenticated users can delete activity" on public.activity_feed;
create policy "Authenticated users can delete activity"
on public.activity_feed for delete
to authenticated
using (true);

-- Let signed-in users read, create, update, and delete reservations.
alter table if exists public.reservations enable row level security;

drop policy if exists "Authenticated users can read reservations" on public.reservations;
create policy "Authenticated users can read reservations"
on public.reservations for select
to authenticated
using (true);

drop policy if exists "Authenticated users can create reservations" on public.reservations;
create policy "Authenticated users can create reservations"
on public.reservations for insert
to authenticated
with check (true);

drop policy if exists "Authenticated users can update reservations" on public.reservations;
create policy "Authenticated users can update reservations"
on public.reservations for update
to authenticated
using (true)
with check (true);

drop policy if exists "Authenticated users can delete reservations" on public.reservations;
create policy "Authenticated users can delete reservations"
on public.reservations for delete
to authenticated
using (true);
