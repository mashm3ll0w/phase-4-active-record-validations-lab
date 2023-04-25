class Post < ApplicationRecord
  validates :title, presence: true
  validate :title_is_not_true_facts
  validates :content, length: { mininum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category_is_fiction_or_non_fiction

  def title_is_not_true_facts
    errors.add(:title, "Title cannot be True Facts") if title == "True Facts"
  end

  def category_is_fiction_or_non_fiction
    unless category == "Fiction" || category == "Non-Fiction"
      errors.add(:category, "Category is either Fiction or Non-Fiction")
    end
  end
end
