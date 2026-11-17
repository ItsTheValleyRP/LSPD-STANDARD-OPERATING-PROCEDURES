-- The Valley SOP portal: Super Owner-controlled management access
-- Run once in Supabase SQL Editor AFTER the existing schema.
alter table public.profiles
  add column if not exists access_status text not null default 'pending'
  check (access_status in ('pending','approved','denied')),
  add column if not exists is_super_owner boolean not null default false;

-- Existing owner accounts remain approved; everyone else must be approved by Super Owner.
update public.profiles
set access_status = case when role = 'owner' then 'approved' else 'pending' end
where access_status is distinct from case when role = 'owner' then 'approved' else 'pending' end;

create or replace function public.is_super_owner()
returns boolean
language sql stable security definer
set search_path = public
as $$
  select exists (
    select 1 from public.profiles
    where id = auth.uid() and active = true and is_super_owner = true
  );
$$;

-- Management permissions are only effective after approval.
create or replace function public.my_role()
returns text
language sql stable security definer
set search_path = public
as $$
  select role from public.profiles
  where id = auth.uid() and active = true
    and (access_status = 'approved' or is_super_owner = true)
$$;

-- The Super Owner is the only account allowed to approve or deny management access.
create or replace function public.review_management_access(target_user uuid, decision text)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  if not public.is_super_owner() then
    raise exception 'Only the Super Owner can review management access requests';
  end if;
  if decision not in ('approved','denied') then
    raise exception 'Decision must be approved or denied';
  end if;
  update public.profiles
  set access_status = decision,
      active = true
  where id = target_user;
  if not found then
    raise exception 'Account not found';
  end if;
end;
$$;

revoke all on function public.review_management_access(uuid,text) from public, anon;
grant execute on function public.review_management_access(uuid,text) to authenticated;

-- Prevent ordinary admins from changing approval/super-owner flags directly.
revoke update on public.profiles from authenticated;
grant update (display_name, role, department_id, active) on public.profiles to authenticated;

-- Ensure a Super Owner can still review requests through the protected RPC.
-- The existing profile SELECT policy lets users see their own profile and
-- owners/admins see staff; add Super Owner visibility for all pending requests.
drop policy if exists "Super Owner reads all profiles" on public.profiles;
create policy "Super Owner reads all profiles" on public.profiles
for select using (public.is_super_owner());

-- Bootstrap your own account exactly once after signing up:
-- Replace the UUID with your Supabase Authentication user UUID.
-- update public.profiles
-- set role = 'owner', active = true, access_status = 'approved', is_super_owner = true
-- where id = 'YOUR_AUTH_USER_UUID';
