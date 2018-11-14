class Task < ApplicationRecord
  validates_presence_of :title
  validate :date_valid?

  private

  def date_valid?
    errors.add :deadline,("不可以是過去的日期") if deadline < Time.zone.now
  end
end
