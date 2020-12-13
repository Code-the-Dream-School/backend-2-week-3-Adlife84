class Order < ApplicationRecord
  belongs_to :customer

  validates :product_name, presence: true # Check that name is not Blank 
  validates :product_count, numericality: { only_integer: true }, presence: true # Check that count is number and can't be Blank
end
