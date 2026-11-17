# Supabase setup — The Valley SOP website

This repository now includes a department-wide management panel at `/admin.html`.

## Files added

- `admin.html` — secure sign-in, SOP editor, department settings, staff permissions, and change history.
- `supabase-config.js` — public project URL and anon/publishable key configuration.
- `supabase-schema.sql` — database tables, roles, Row Level Security policies, and audit triggers.
- `supabase-seed-lspd.sql` — imports the current 22-section LSPD master SOP into the database.

## 1. Create the Supabase project

1. Create a project in the Supabase dashboard.
2. Open **Project Settings → API** (or **API Keys**).
3. Copy the Project URL and the anon/publishable browser key.
4. Never use or publish the `service_role` key or a secret key in website code.

## 2. Create the database

1. Open **SQL Editor** in the Supabase dashboard.
2. Paste and run all of `supabase-schema.sql`.
3. Paste and run all of `supabase-seed-lspd.sql`.
4. Confirm that the `departments` table has 10 rows and `sop_sections` has 22 LSPD sections.

The seed file preserves the current LSPD SOP text. Other department and division records are created but remain empty until approved SOPs are added through the panel.

## 3. Configure the website

Edit `supabase-config.js` and replace the two placeholders:

- `VALLEY_SUPABASE_URL` → the Supabase Project URL.
- `VALLEY_SUPABASE_ANON_KEY` → the anon/publishable key.

These are browser-safe values. Database access is protected by the Row Level Security policies in the schema.

## 4. Create the first Owner account

1. In Supabase, open **Authentication → Users**.
2. Add your own user with your email and a strong password.
3. Copy that user's UUID.
4. In SQL Editor, run the following, replacing the UUID and display name:

```sql
update public.profiles
set role = 'owner',
    display_name = 'Your Display Name',
    active = true
where id = 'PASTE-YOUR-AUTH-USER-UUID-HERE';
```

5. Open the website's `admin.html` page and sign in.

New user profiles default to Viewer. An Owner or Administrator can change roles and department assignments in **Staff & permissions**. Only Owners can grant or change the Owner role; Administrators cannot promote themselves or others to Owner.

## 5. Access and roles

- **Owner** — full access, including managing staff and assigning Owners.
- **Administrator** — manage all departments, SOPs, and non-owner staff accounts.
- **Department Head** — manage SOP content for their assigned department.
- **Editor** — create and edit SOP content for their assigned department.
- **Viewer** — read-only access to published SOPs.

Public visitors can read published sections without signing in. Draft sections are only visible to staff who have permission for that department.

## 6. Website addresses

- Public SOP website: `https://itsthevalleyrp.github.io/LSPD-STANDARD-OPERATING-PROCEDURES/`
- Management panel: `https://itsthevalleyrp.github.io/LSPD-STANDARD-OPERATING-PROCEDURES/admin.html`

GitHub Pages must be enabled for the repository. After committing the Supabase config, allow Pages to rebuild before testing.

## Important

Do not disable Row Level Security. Do not place service-role or secret keys in `supabase-config.js`, HTML, JavaScript, or any GitHub file. If an account should no longer have access, set its profile to inactive in the staff panel.
