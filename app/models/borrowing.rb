class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :due_date, presence: true
  validates :book_id, uniqueness: { scope: :returned_at,
    message: "is already borrowed" }, if: -> { returned_at.nil? }

  before_create :set_due_date

  private

  def set_due_date
    self.due_date ||= 2.weeks.from_now
  end
end
