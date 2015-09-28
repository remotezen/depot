class Product < ActiveRecord::Base
  validates  :description, :image_url, presence:true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'Must be a Url for GIF, JPG OR PNG image.'
  }
  validates :title, presence: true, uniqueness: {case_sensitive: false}

end
