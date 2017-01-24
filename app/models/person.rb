class Person < ActiveRecord::Base
  def age
    (Date.today.strftime("%Y%m%d").to_i - self.birth.strftime("%Y%m%d").to_i) / 10000
  end
end
