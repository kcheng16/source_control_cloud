SELECT
    p.id as product_id,
    p.name as pricing_plan_name,
    CASE WHEN pcpo.product_collection_id IS NOT NULL THEN product_collections.name
	     WHEN cpo.course_id IS NOT NULL THEN courses.name
	     WHEN dppo.digital_product_id IS NOT NULL THEN digital_products.name
	     WHEN cppo.creator_product_id IS NOT NULL THEN creator_products.name
	     WHEN mpo.membership_tier_id IS NOT NULL THEN membership_tiers.name
	END AS product_name
FROM products p
LEFT JOIN product_collection_pricing_options AS pcpo
    ON p.id = pcpo.product_id
LEFT JOIN product_collections ON pcpo.product_collection_id = product_collections.id
LEFT JOIN course_pricing_options AS cpo
    ON p.id = cpo.product_id
LEFT JOIN courses ON cpo.course_id = courses.id
LEFT JOIN digital_product_pricing_options AS dppo
    ON p.id = dppo.product_id
LEFT JOIN digital_products ON dppo.digital_product_id = digital_products.id
LEFT JOIN creator_product_pricing_options AS cppo
    ON p.id = cppo.product_id
LEFT JOIN creator_products ON cppo.creator_product_id = creator_products.id
LEFT JOIN membership_tier_pricing_options AS mpo
    ON p.id = mpo.product_id
LEFT JOIN membership_tiers ON mpo.membership_tier_id = membership_tiers.id
WHERE p.school_id = {{current_user.metadata.SchoolID}}