view: dt_test_2 {

  derived_table: {

    sql: SELECT id FROM demo_db.orders
    WHERE {% condition %} DATE(orders.created_at ) {% endcondition %}

    ;;
  }

  filter: date_filter {
    type: date
  }


  dimension: id {}
}
