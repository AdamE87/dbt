{% macro limit_data_in_dev(field_name, number_of_days) %}
    {%- if target.name=='default': -%}
        where {{ field_name }} >= date_add(current_date(),INTERVAL -{{ number_of_days }} DAY)
    {%- endif -%}
{% endmacro %}