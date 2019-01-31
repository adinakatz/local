# include: "test_ndt_model.model"
include: "orders.view"


explore: ndt_test_sql_error {}

view: ndt_test_sql_error {
 derived_table: {
   explore_source: orders {
     column: id {}
   }

  sql_trigger_value: SELECT max(id) ;;
 }
}
