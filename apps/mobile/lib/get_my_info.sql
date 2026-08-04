SELECT *
FROM non_spatial.staff
where email = {{ current_user.email }}