class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 10 }
  default_scope -> { order(id: :desc) }

  def self.search(search)
      if search
        Book.where(['title LIKE ?', "%#{search}%"])
      else
        Book.all
      end
  end
end
