Deface::Override.new(:virtual_path => "spree/admin/products/new",
  :name => "add_user_id",
  :insert_after => "[data-hook='product-from-prototype']",
  :text => "
  <%= f.hidden_field :user_id, value: spree_current_user.id %>
  	"
  )