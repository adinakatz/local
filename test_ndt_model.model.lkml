connection: "thelook"

include: "*.view.lkml"                       # include all views in this project

explore: orders {

  sql_always_where: ${orders.id} >= 1 ;;
  join: dt_test_2 {
    sql_on: ${dt_test_2.id} = ${orders.id} ;;
  }

  join: test {
    from: orders
    sql_on: ${test.id}=${dt_test_2.id} ;;
  }

  join: test_2 {
    from: orders
    sql_on: ${test_2.id}=${orders.id} ;;
  }
}

explore: order_2 {
  view_name: orders

  join: dt_test_2 {
    sql_on: ${dt_test_2.id} = ${orders.id} ;;
  }
}
