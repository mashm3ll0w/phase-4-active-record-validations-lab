class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :title_is_not_true_facts

  def title_is_not_true_facts
    errors.add(:title, "Title cannot be True Facts!") if title == "True Facts"
  end
end
