view: dt_test {

  derived_table: {
    sql:
    SELECT * FROM demo_db.orders
    WHERE orders.created_at >= {% date_start orders.created_date %} - interval 1 year ;;

  }


  dimension: id {}
  dimension_group: created_at {
    type: time
    timeframes: [date]
    sql: ${TABLE}.created_at ;;
  }

  }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
