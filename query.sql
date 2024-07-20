SELECT
  extract(year from a.created_at) created_year
  ,extract(month from a.created_at) created_month
  ,b.name
  ,count(a.id) as total_sold
FROM 
  `bigquery-public-data.thelook_ecommerce.order_items` a
  left join
  `bigquery-public-data.thelook_ecommerce.products` b
  on
    a.product_id = b.id
where
  a.status = 'Complete'
group by
  extract(year from a.created_at)
  ,extract(month from a.created_at)
  ,b.name
order by
  created_year asc
  ,created_month asc
  ,total_sold desc
LIMIT 
  1000
