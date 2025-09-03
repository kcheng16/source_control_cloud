WITH perms AS (
-- compute per-app access based on universal group access controls
  SELECT
    u.email,
    u."firstName",
    u."lastName",
    g.name AS "groupName",
    f.name AS "folderName",
    p.name AS "appName",
    CASE
      WHEN g."universalAccess" = 'own' THEN 3
      WHEN g."universalAccess" = 'write' THEN 2
      WHEN g."universalAccess" = 'read' THEN 1
      ELSE 0
    END AS "accessLevel"
  FROM groups AS g
  JOIN user_groups AS ug ON ug."groupId" = g.id
  LEFT JOIN users AS u ON u.id = ug."userId"
  LEFT JOIN pages AS p ON TRUE
  LEFT JOIN folders AS f on p."folderId" = f.id
  WHERE g."archivedAt" IS NULL AND u.enabled = TRUE AND g."universalAccess" <> 'none'
-- combine with per-app access list based on granular group access controls
  UNION
  SELECT  
    u.email,
    u."firstName", 
    u."lastName", 
    g.name AS "groupName",
  	f.name AS "folderName",
    p.name AS "appName",
    CASE
      WHEN gp."accessLevel" = 'own' THEN 3
      WHEN gp."accessLevel" = 'write' THEN 2
      WHEN gp."accessLevel" = 'read' THEN 1
      ELSE 0
    END AS "accessLevel"
  FROM groups AS g
  JOIN user_groups AS ug ON ug."groupId" = g.id
  LEFT JOIN users AS u ON u.id = ug."userId"
  LEFT JOIN pages AS p ON p."folderId" = g.id
  LEFT JOIN folders AS f on p."folderId" = f.id
  RIGHT JOIN group_pages AS gp ON gp."groupId"= g.id
  WHERE g."archivedAt" IS NULL AND u.enabled = TRUE AND gp."accessLevel" <> 'none'
),
ranked_perms AS (
-- add a ranking column such that rank 1 has the highest per-user-per-app access level
  SELECT
    perms.*,
    ROW_NUMBER() OVER (
      PARTITION BY perms.email, perms."folderName", perms."appName"
      ORDER BY perms."accessLevel" DESC
    ) AS perm_rank
  FROM perms
)
-- select highest access level for each user-app combination, prettify output and apply any additional filters needed
SELECT 
  ranked_perms.email AS "Email",
  CONCAT(ranked_perms."firstName", ' ', ranked_perms."lastName") as "Name",
  ranked_perms."groupName" ,
  ranked_perms."folderName",
  ranked_perms."appName",
  CASE 
    WHEN ranked_perms."accessLevel" = 3 THEN 'own'
    WHEN ranked_perms."accessLevel" = 2 THEN 'write'
    WHEN ranked_perms."accessLevel" = 1 THEN 'read'
    ELSE 'none'
  END as "Access Level"  
FROM ranked_perms 
WHERE ranked_perms.perm_rank = 1 
-- AND 
-- uncomment one or more of these to filter access list by folder, app, or user
  -- "folderName" = '<FOLDER NAME>'
  -- "appName" = '<APP NAME>'
  -- "email" = '<USER EMAIL>'