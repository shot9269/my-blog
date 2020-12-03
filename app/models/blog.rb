class Blog < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  has_one_attached :image
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :content
    validates :genre_id
  end
  has_rich_text :content

end
