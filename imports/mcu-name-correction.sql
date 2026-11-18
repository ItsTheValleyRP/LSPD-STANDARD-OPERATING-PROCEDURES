-- The Valley | Correct MCU department name
-- Run once in Supabase SQL Editor to update the live website's department heading.

update public.departments
set
  name = 'Motorcycle Unit',
  description = 'Motorcycle Unit procedures and standards.'
where slug = 'mcu';

-- Confirm the updated department record.
select slug, name, description
from public.departments
where slug = 'mcu';
