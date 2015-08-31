class AddApproveToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :approve, :boolean, default: false
  end
end
