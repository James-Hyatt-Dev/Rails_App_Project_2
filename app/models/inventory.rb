class Inventory < ApplicationRecord
  belongs_to :item
  belongs_to :owner

  validates_presence_of :quantity, :unit, message: "Your Missing Something. Please Fill In All Filds"

  accepts_nested_attributes_for :item

  scope(:quantity_search, ->(quantity) { self.where("quantity >= ?", quantity) })
end
