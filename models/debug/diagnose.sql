select
    current_user() as user,
    current_role() as role,
    current_database() as db,
    current_schema() as schema,
    current_warehouse() as warehouse,
    current_account() as account