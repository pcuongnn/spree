Spree::User.class_eval do
   has_many :spree_products, :class_name => 'Spree::Product'
end