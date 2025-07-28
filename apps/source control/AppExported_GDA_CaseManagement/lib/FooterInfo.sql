select p.*, coalesce(t."createdAt", p."updatedAt") as last_modified_date
from pages p
left join tags t
on p."releasedTagId" = t.id
where p.uuid = {{ AppUUID }}