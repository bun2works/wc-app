class Comment < ApplicationRecord
  belongs_to :post, touch: true
  belongs_to :team

  validates :body, presence: true, length: {maximum: 300}
end
