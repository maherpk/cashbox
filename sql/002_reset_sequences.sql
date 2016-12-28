-- SELECT 'SELECT SETVAL(' ||
--        quote_literal(quote_ident(PGT.schemaname) || '.' || quote_ident(S.relname)) ||
--        ', COALESCE(MAX(' ||quote_ident(C.attname)|| '), 1) ) FROM ' ||
--        quote_ident(PGT.schemaname)|| '.'||quote_ident(T.relname)|| ';'
-- FROM pg_class AS S,
--      pg_depend AS D,
--      pg_class AS T,
--      pg_attribute AS C,
--      pg_tables AS PGT
-- WHERE S.relkind = 'S'
--     AND S.oid = D.objid
--     AND D.refobjid = T.oid
--     AND D.refobjid = C.attrelid
--     AND D.refobjsubid = C.attnum
--     AND T.relname = PGT.tablename
-- ORDER BY S.relname;

SELECT setval(pg_get_serial_sequence('categories', 'id'), coalesce(max(id),0) + 1, false) FROM categories;
SELECT setval(pg_get_serial_sequence('discounts', 'id'), coalesce(max(id),0) + 1, false) FROM discounts;
SELECT setval(pg_get_serial_sequence('items', 'id'), coalesce(max(id),0) + 1, false) FROM items;
SELECT setval(pg_get_serial_sequence('knex_migrations', 'id'), coalesce(max(id),0) + 1, false) FROM knex_migrations;
SELECT setval(pg_get_serial_sequence('line_items', 'id'), coalesce(max(id),0) + 1, false) FROM line_items;
SELECT setval(pg_get_serial_sequence('settings', 'id'), coalesce(max(id),0) + 1, false) FROM settings;
SELECT setval(pg_get_serial_sequence('shifts', 'id'), coalesce(max(id),0) + 1, false) FROM shifts;
SELECT setval(pg_get_serial_sequence('suppliers', 'id'), coalesce(max(id),0) + 1, false) FROM suppliers;
SELECT setval(pg_get_serial_sequence('supplies', 'id'), coalesce(max(id),0) + 1, false) FROM supplies;
SELECT setval(pg_get_serial_sequence('transactions', 'id'), coalesce(max(id),0) + 1, false) FROM transactions;