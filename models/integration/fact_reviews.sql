{{config(
    materialized = 'incremental'
    )
}}
 
select * from
{{ref('src_reviews')}}
WHERE review_text is not null --stg.airbnb.src_reviews
{% if is_incremental() %} --INC LOAD APPEND ONLY using it as a type of macro
and review_date > (select max(review_date) from {{this}})
{% endif %}