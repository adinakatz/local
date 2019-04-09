view: trigger_test {

  derived_table: {
    sql: SELECT * FORM demo_bd.orders ;;
    datagroup_trigger: test
  }

 dimension: id {}
}
