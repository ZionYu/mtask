class Task < ApplicationRecord
  validates_presence_of :title
  validate :date_valid?
  enum state: {todo: 0, processing: 1, done: 2 }
  enum priority: {high: 0, medium: 1, low: 2 }


  private

  def date_valid?
    errors.add :deadline,("不可以是過去的日期") if deadline < Time.zone.now
  end
end
