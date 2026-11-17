# Super Owner access setup

The public SOP website remains readable without signing in. The **Sign in** button is optional. Accounts created there use the same Supabase Auth credentials as the management panel.

## 1. Apply the access-control migration

In the Supabase dashboard, open **SQL Editor → New query**. Copy the complete contents of `supabase-access-approval.sql` from this repository, run it, and confirm it completes successfully.

This adds a pending/approved/denied management-access state and a protected database function. Only the designated Super Owner can approve or deny requests.

## 2. Designate the Super Owner

In Supabase, open **Authentication → Users**, copy the UUID for your own account, then run this once in SQL Editor (replace the UUID):

```sql
update public.profiles
set role = 'owner',
    active = true,
    access_status = 'approved',
    is_super_owner = true
where id = 'YOUR_AUTH_USER_UUID';
```

Do not give the Super Owner designation to anyone else.

## 3. How members use it

1. Anyone can read the SOPs without an account.
2. A member may choose **Sign in → Create account** on the public SOP website.
3. The same email and password are used at `admin.html`.
4. A new account starts with management access **pending**.
5. The Super Owner opens **Management → Access requests** and approves or denies it.
6. After approval, the member can sign in to the management panel. Their role and department permissions still determine what they can edit.

## Security notes

- The approval decision is enforced in Supabase, not only in the page interface.
- The browser uses only the project's publishable key. Never put a Supabase secret/service-role key in GitHub.
- If an account is denied, it can still authenticate as a website account, but cannot enter the management panel.
