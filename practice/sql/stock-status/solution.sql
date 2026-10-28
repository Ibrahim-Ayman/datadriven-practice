SELECT product_name , 
    category , 
    price , 
    CASE WHEN in_stock =1 THEN 'In Stock' 
    ELSE 'Out of Stock' 
    END AS availability
FROM products p
WHERE price IS NOT NULL
ORDER BY product_name
