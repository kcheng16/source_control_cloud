SELECT id, name, 'courses' as type from courses 
  WHERE school_id = {{current_user.metadata.SchoolID}}
UNION SELECT id, name, 'digital_products' as type FROM digital_products 
  WHERE school_id = {{ current_user.metadata.SchoolID}} 
UNION SELECT id, name, 'product_collections' as type FROM product_collections 
  WHERE school_id = {{current_user.metadata.SchoolID}}
UNION SELECT id, name, 'creator_products' as type FROM creator_products 
  WHERE school_id = {{current_user.metadata.SchoolID}}
UNION SELECT id, name, 'memberships_tiers' as type FROM membership_tiers 
  WHERE school_id = {{current_user.metadata.SchoolID}}
ORDER BY id
