{% snapshot listings_snapshot %}
	{{
	config(
		database = 'int',
		schema = 'snapshot',
		unique_key = 'listing_id',
		strategy = 'check',
		check_cols = ['listing_url','room_type','minimum_nights','price_str'],
		invalidate_hard_deletes =False
		)
	}}

SELECT
id , 
name , 
listing_url, 
room_type, 
minimum_nights, 
host_id,
price , created_at, updated_at
FROM
source('raw_airbnb','listings')

{% endsnapshot %}