class Post < ApplicationRecord
  belongs_to :team, touch: true
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {maximum: 100}

  scope :find_newest_post, -> (page) { order(updated_at: :desc).page(page).per(20) }
  scope :with_team_and_comment, -> { includes(team: [image_attachment: :blob], comments: [team: [image_attachment: :blob]]) }
end
