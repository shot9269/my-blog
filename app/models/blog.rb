class Blog < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :content
  end
  has_rich_text :content
end
