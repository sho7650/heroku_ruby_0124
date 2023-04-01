class Person < ActiveRecord::Base
  validates :name,
    length: { minimum: 1, maximum: 256}
  validates :birth,
    presence: true

  def age
    (Date.today.strftime("%Y%m%d").to_i - self.birth.strftime("%Y%m%d").to_i) / 10000
  end
end
