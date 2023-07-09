select * from {{ref("dim_listing_cleansed")}} l
inner join {{ref("fct_reviews")}} r
using (listing_id)
where l.created_at >= r.review_date

-- with earliest_review as (
--     select listing_id, min(review_date) as min_review_date
--     from {{ref("fct_reviews")}}
--     group by listing_id 
    

-- )


-- select 
--     *
-- from 
--     {{ ref("dim_listing_cleansed")}} as l
-- JOIN
--     earliest_review as r
-- on 
--     l.listing_id = r.listing_id
-- where
--     date(l.created_at) > date(r.min_review_date)