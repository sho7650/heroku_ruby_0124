class Person < ActiveRecord::Base
  validates :name,   presence: true, length: { maximum: 256 }
  validates :birth,  presence: true, comparison: { less_than_or_equal_to: -> (_) { Date.current } }
  validates :height, numericality: { greater_than: 0, less_than: 300 }, allow_nil: true
  validates :home,   length: { maximum: 256 }, allow_nil: true
  validates :office, length: { maximum: 256 }, allow_nil: true

  def age
    return nil unless birth
    today = Date.current
    today.year - birth.year - (today.strftime('%m%d') < birth.strftime('%m%d') ? 1 : 0)
  end
end
