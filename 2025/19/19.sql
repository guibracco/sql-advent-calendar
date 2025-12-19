-- Question 1 of 1

-- Clara is reviewing holiday orders to uncover hidden patterns — can you return the total amount of wrapping paper used for orders that were both gift-wrapped and successfully delivered?

-- holiday_orders (order_id: INT, customer_name: VARCHAR, gift_wrap: BOOLEAN, paper_used_meters: DECIMAL, delivery_status: VARCHAR, order_date: DATE)

select
    sum(paper_used_meters) as total_wrapping_paper_used
from holiday_orders
where
    gift_wrap is true
    and delivery_status = 'Delivered'
