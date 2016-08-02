class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  #display review in ordered manner Desending
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }


end
