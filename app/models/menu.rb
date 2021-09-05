class Menu < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  has_one_attached :image
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }
  has_many :cart_items, dependent: :destroy 
  has_many :history_items, dependent: :destroy
  # 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [105, 105])
  end
  attribute :existence, :boolean, default: true
end
