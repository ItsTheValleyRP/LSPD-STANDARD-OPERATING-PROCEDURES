-- The Valley SOP text revision history
-- Run once in Supabase SQL Editor after the admin.html update.

create table if not exists public.sop_revisions (
  id bigint generated always as identity primary key,
  section_id uuid not null,
  department_id uuid not null,
  content text not null,
  actor_id uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now()
);

create index if not exists sop_revisions_section_created_idx
  on public.sop_revisions(section_id, created_at desc);

alter table public.sop_revisions enable row level security;

drop policy if exists "Authorized staff read SOP revisions" on public.sop_revisions;
create policy "Authorized staff read SOP revisions"
  on public.sop_revisions for select
  to authenticated
  using (public.can_manage_department(department_id));

revoke all on public.sop_revisions from anon, authenticated;
grant select on public.sop_revisions to authenticated;

create or replace function public.save_sop_revision()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if old.content is distinct from new.content then
    insert into public.sop_revisions(section_id, department_id, content, actor_id)
    values(old.id, old.department_id, old.content, auth.uid());
  end if;
  return new;
end;
$$;

drop trigger if exists sop_revision_before_update on public.sop_sections;
create trigger sop_revision_before_update
before update on public.sop_sections
for each row execute function public.save_sop_revision();
