view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: yesno_test {
    type: yesno
    sql: ${TABLE}.order_id = 1 OR ${TABLE}.order_id = 2 ;;
  }

  parameter: param_test {
    allowed_value: {
      label: "test"
      value: "test"
    }
  }
  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: link_dimension {
    sql: CASE WHEN {{ inventory_item_id._in_query }} = true
    THEN ${inventory_item_id}
    ELSE "No Link"
    END ;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
    html:
    {% if {{link_dimension._value}} == "No Link" %}
    "No Link"
    {% else %}
    <a href= "{{link_dimension._value}}">"test"<a>
    {% endif %} ;;
  }
}
