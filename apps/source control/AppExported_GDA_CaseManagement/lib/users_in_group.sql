select distinct 
  u."email" as user_email
from
  groups g
  
  join user_groups ug
  on g."id" = ug."groupId"

  join users u
  on ug."userId" = u."id"
  and u."enabled" = 'true'
where g."name" in ('admin', 'Claim Dept Supervisor')