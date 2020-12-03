class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'テクニカル' },
    { id: 2, name: 'ファンダメンタル' },
    { id: 3, name: '書籍' },
    { id: 4, name: '思ったこと' },
    { id: 5, name: '相談質' },
  ]

  include ActiveHash::Associations
  has_many :blogs
end