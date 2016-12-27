CREATE VIEW "lineitems_vista" AS
SELECT
    id,
    created_at,
    updated_at,
    shift_id,
    itms.name as name,
    quantity,
    transaction_id as transaction,
    itms.price as unit_price,
    itms.price*quantity as item_total,
    itms.category_id,
    category
  FROM line_items
    LEFT JOIN (
      SELECT name, price, category_id, id as iid FROM items
    ) as itms ON line_items.item_id = itms.iid
    LEFT JOIN (
      SELECT created_at, updated_at, shift_id, id as tid FROM transactions
    ) as trnsctns ON line_items.transaction_id = trnsctns.tid
    LEFT JOIN (
      SELECT name as category, id as cid FROM categories
      ) as ctgrs ON itms.category_id = ctgrs.cid;