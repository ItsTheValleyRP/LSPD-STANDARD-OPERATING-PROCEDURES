-- The Valley SOP Management — Supabase schema
-- Run this entire file in Supabase SQL Editor.
create extension if not exists pgcrypto;

create table if not exists public.departments (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  name text not null,
  description text not null default '',
  sort_order integer not null default 0,
  enabled boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default '',
  email text not null default '',
  role text not null default 'viewer' check (role in ('owner','admin','department_head','editor','viewer')),
  department_id uuid references public.departments(id) on delete set null,
  active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.sop_sections (
  id uuid primary key default gen_random_uuid(),
  department_id uuid not null references public.departments(id) on delete cascade,
  section_number text not null,
  title text not null,
  content text not null default '',
  sort_order integer not null default 0,
  published boolean not null default false,
  updated_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(department_id, section_number)
);

create table if not exists public.audit_log (
  id bigint generated always as identity primary key,
  actor_id uuid references auth.users(id) on delete set null,
  action text not null,
  table_name text not null,
  record_id text,
  department_id uuid,
  summary jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists sop_sections_department_order_idx
  on public.sop_sections(department_id, sort_order, section_number);
create index if not exists audit_log_created_idx on public.audit_log(created_at desc);

insert into public.departments(slug,name,description,sort_order) values
 ('lspd','Los Santos Police Department','Department-wide rules, responsibilities, and operational standards for LSPD personnel.',1),
 ('sasp','San Andreas State Police','State Police standard operating procedures.',2),
 ('bcso','Blaine County Sheriff’s Office','Sheriff’s Office standard operating procedures.',3),
 ('swat','Special Weapons and Tactics','SWAT division procedures and standards.',4),
 ('cid','Criminal Investigation Division','Criminal Investigation Division procedures and standards.',5),
 ('k9','K-9 Unit','K-9 Unit procedures and standards.',6),
 ('ia','Internal Affairs','Internal Affairs procedures and standards.',7),
 ('heat','High Enforcement Action Team','HEAT division procedures and standards.',8),
 ('air1','Air 1','Air 1 aviation unit procedures and standards.',9),
 ('mcu','Motorcycle Unit','Motorcycle Unit procedures and standards.',10)
on conflict(slug) do update set name=excluded.name, description=excluded.description, sort_order=excluded.sort_order;

create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end; $$;

drop trigger if exists departments_updated_at on public.departments;
create trigger departments_updated_at before update on public.departments
for each row execute function public.set_updated_at();
drop trigger if exists profiles_updated_at on public.profiles;
create trigger profiles_updated_at before update on public.profiles
for each row execute function public.set_updated_at();
drop trigger if exists sop_sections_updated_at on public.sop_sections;
create trigger sop_sections_updated_at before update on public.sop_sections
for each row execute function public.set_updated_at();

create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = public as $$
begin
  insert into public.profiles(id, display_name, email, role, active)
  values (new.id, coalesce(new.raw_user_meta_data->>'name',''), coalesce(new.email,''), 'viewer', true)
  on conflict(id) do nothing;
  return new;
end; $$;
drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created after insert on auth.users
for each row execute function public.handle_new_user();

create or replace function public.my_role()
returns text language sql stable security definer set search_path = public as $$
  select role from public.profiles where id = auth.uid() and active = true
$$;
create or replace function public.can_manage_department(target uuid)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (
    select 1 from public.profiles p
    where p.id = auth.uid() and p.active = true
      and (p.role in ('owner','admin')
        or (p.role in ('department_head','editor') and p.department_id = target))
  )
$$;

alter table public.departments enable row level security;
alter table public.profiles enable row level security;
alter table public.sop_sections enable row level security;
alter table public.audit_log enable row level security;

drop policy if exists "Public can read enabled departments" on public.departments;
create policy "Public can read enabled departments" on public.departments for select using (enabled = true or public.my_role() in ('owner','admin'));
drop policy if exists "Admins manage departments" on public.departments;
create policy "Admins manage departments" on public.departments for all using (public.my_role() in ('owner','admin')) with check (public.my_role() in ('owner','admin'));

drop policy if exists "Users read own profile or admins read all" on public.profiles;
create policy "Users read own profile or admins read all" on public.profiles for select using (id = auth.uid() or public.my_role() in ('owner','admin'));
drop policy if exists "Owners and admins manage profiles" on public.profiles;
drop policy if exists "Owners and admins update profiles" on public.profiles;
create policy "Owners and admins update profiles" on public.profiles for update
using (public.my_role() = 'owner' or (public.my_role() = 'admin' and role <> 'owner'))
with check (public.my_role() = 'owner' or (public.my_role() = 'admin' and role <> 'owner'));

drop policy if exists "Public can read published SOP sections" on public.sop_sections;
create policy "Public can read published SOP sections" on public.sop_sections for select using (published = true or public.can_manage_department(department_id));
drop policy if exists "Authorized staff insert SOP sections" on public.sop_sections;
create policy "Authorized staff insert SOP sections" on public.sop_sections for insert with check (public.can_manage_department(department_id));
drop policy if exists "Authorized staff update SOP sections" on public.sop_sections;
create policy "Authorized staff update SOP sections" on public.sop_sections for update using (public.can_manage_department(department_id)) with check (public.can_manage_department(department_id));
drop policy if exists "Authorized staff delete SOP sections" on public.sop_sections;
create policy "Authorized staff delete SOP sections" on public.sop_sections for delete using (public.can_manage_department(department_id));

drop policy if exists "Admins read audit log" on public.audit_log;
create policy "Admins read audit log" on public.audit_log for select using (public.my_role() in ('owner','admin'));
-- Audit entries are written by database triggers, not directly by browser clients.
revoke insert, update, delete on public.audit_log from anon, authenticated;

create or replace function public.write_sop_audit()
returns trigger language plpgsql security definer set search_path = public as $$
declare dept uuid; rec text; act text; secno text; sectitle text;
begin
  if tg_op = 'DELETE' then
    dept := old.department_id; rec := old.id::text; act := 'DELETE';
    secno := old.section_number; sectitle := old.title;
  else
    dept := new.department_id; rec := new.id::text;
    act := case when tg_op = 'INSERT' then 'INSERT' else 'UPDATE' end;
    secno := new.section_number; sectitle := new.title;
  end if;
  insert into public.audit_log(actor_id, action, table_name, record_id, department_id, summary)
  values(auth.uid(), act, 'sop_sections', rec, dept,
    jsonb_build_object('section_number', secno, 'title', sectitle));
  if tg_op = 'DELETE' then return old; else return new; end if;
end; $$;
drop trigger if exists sop_sections_audit on public.sop_sections;
create trigger sop_sections_audit after insert or update or delete on public.sop_sections
for each row execute function public.write_sop_audit();

-- After creating your own account in the panel, promote that account once:
-- update public.profiles set role='owner', display_name='Your Name' where id='AUTH_USER_UUID';

-- Record department and staff-permission changes in the audit log as well.
create or replace function public.write_admin_audit()
returns trigger language plpgsql security definer set search_path = public as $$
declare rec text; dept uuid; act text; details jsonb;
begin
  if tg_op = 'DELETE' then
    rec := old.id::text; act := 'DELETE';
    if tg_table_name = 'profiles' then dept := old.department_id; details := jsonb_build_object('email',old.email,'role',old.role);
    else details := jsonb_build_object('name',old.name,'slug',old.slug); end if;
  else
    rec := new.id::text; act := case when tg_op='INSERT' then 'INSERT' else 'UPDATE' end;
    if tg_table_name = 'profiles' then dept := new.department_id; details := jsonb_build_object('email',new.email,'role',new.role);
    else details := jsonb_build_object('name',new.name,'slug',new.slug); end if;
  end if;
  insert into public.audit_log(actor_id,action,table_name,record_id,department_id,summary)
  values(auth.uid(),act,tg_table_name,rec,dept,details);
  if tg_op='DELETE' then return old; else return new; end if;
end; $$;
drop trigger if exists departments_audit on public.departments;
create trigger departments_audit after insert or update or delete on public.departments
for each row execute function public.write_admin_audit();
drop trigger if exists profiles_audit on public.profiles;
create trigger profiles_audit after update on public.profiles
for each row execute function public.write_admin_audit();
