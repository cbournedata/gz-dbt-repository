with

 source as (

     select * from {{ source('raw', 'ship') }}

 ),

 renamed as (

     select
         orders_id,
         shipping_fee,
         logCost,
         CAST(ship_cost AS FLOAT)

     from source

 )

 select * from renamed