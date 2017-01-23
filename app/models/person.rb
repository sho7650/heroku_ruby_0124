class Person < ActiveRecord::Base
  def age
    d1=self.birth.strftime("%Y%m%d").to_i
    d2=Date.today.strftime("%Y%m%d").to_i
    return (d2 - d1) / 10000
  end
end
