
{% macro is_even(column_name) %}
   ( ({{ column_name }} % 2) =0) 
{% endmacro %}


