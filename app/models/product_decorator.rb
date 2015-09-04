Spree::Product.class_eval do
   belongs_to :user, :class_name => 'Spree::User'
   scope :approved, ->{where(approve: true)}
end