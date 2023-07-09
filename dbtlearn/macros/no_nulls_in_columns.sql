{% macro no_nulls_in_columns(model) %}
    select * 
    from {{model}} 
    where
        {% for col in adapter.get_columns_in_relation(model) -%} -- there is a -% just to trim of white spaces
            {{ col.column}} is null or
        {% endfor %}
        FALSE
{% endmacro %}