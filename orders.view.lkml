include: "ndt_test_sql_error.view"

explore: orders {}

explore: ndt_test_sql_error {}

view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id - 10;;
    html: {% if value < 0 %}
    -${{ rendered_value | replace: "-" "" }}
      {% endif %} ;;
      value_format: "#,##0.00"
  }

   dimension: id_form {
    type: number
    sql: ${TABLE}.id - 10;;
    value_format: "#,##0.00"
   }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: date
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: test {
    type: number
    sql: (SELECT min(id) FROM demo_db.orders
    WHERE {% condition orders.created_date %} orders.created_at {% endcondition %}) ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: order_items_id {
    sql: ${order_items.id} ;;
  }
  parameter: dynamic_pivot {
    allowed_value: { value: "id" }
    allowed_value: { value: "status" }
  }

  dimension: dynamic_pivot_dimension {
    sql: CASE WHEN {% parameter dynamic_pivot %} = "id" THEN cast(${TABLE}.id as CHAR)
    ELSE ${TABLE}.status
    END ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
  }
}
