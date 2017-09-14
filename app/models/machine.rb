class Machine < ApplicationRecord
  belongs_to :owner
  has_many :snack_machines
  has_many :snacks, through: :snack_machines

  def count_of_snacks
    snacks.count
  end

  def average_price
    prices = snacks.map do |snack|
      snack.price
    end
    count = prices.count
    sum = prices.inject(0){|sum,x| sum + x }
    sum/count
  end
end
