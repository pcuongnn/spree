Deface::Override.new(:virtual_path => "spree/shared/_main_nav_bar",
  :name => "add_product",
  :insert_before => "li#home-link",
  :text => "<% if spree_current_user %>
  <li data-hook><%= link_to 'Products', all_product_user_path %></li>
  <% end %> "
  )