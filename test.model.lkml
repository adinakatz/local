connection: "thelook"

include: "*.view"


datagroup: test {
  sql_trigger: SELECT CASE WHEN 1=2 THEN "Hello" END FROM demo_db.orders ;;
}

explore: trigger_test {}

# explore: a {
#   view_name: orders
#
#   join: order_items {}
#   sql_on: 1=1 ;;
# }
# explore: b {
#   view_name: orders
# }
