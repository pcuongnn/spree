Deface::Override.new(:virtual_path => "spree/admin/products/_form",
  :name => "add_approve",
  :insert_before => "[data-hook='admin_product_form_name']",
  :text => "
  <%= f.field_container :name, class: ['form-group'] do %>
  	<%= f.label :approve %>
  	<%= f.check_box :approve, class: 'form-control' %>
  <% end %>"
  )

Deface::Override.new(:virtual_path => "spree/shared/_products",
  :name => "show_approve",
  :surround => "[data-hook='products_list_item']",
  :text => "
  <% if product.approve == true %>
  	<%= render_original %>
  <% end %>"
  )