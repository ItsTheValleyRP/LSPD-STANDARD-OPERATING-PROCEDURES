-- Import the current LSPD master SOP into Supabase.
-- Run after supabase-schema.sql. This preserves the supplied section text.
insert into public.sop_sections(department_id, section_number, title, content, sort_order, published)
select d.id, v.section_number, v.title, v.content, v.sort_order, true
from public.departments d
cross join (values

) as v(section_number,title,content,sort_order)
where d.slug='lspd'
on conflict(department_id,section_number) do update
set title=excluded.title, content=excluded.content, sort_order=excluded.sort_order, published=true;
