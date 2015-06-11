class Material < ActiveRecord::Base

  def use(amount)
    self.quantity = quantity - amount
    self.save
  end

end
