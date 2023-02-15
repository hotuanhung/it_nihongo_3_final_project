class Book < ApplicationRecord
  belongs_to :library
  validates :isbn, presence: true
  validates :title, presence: true
  validates :authors, presence: true
  validates :published, presence: true
  validates :edition, presence: true
  validates :language, presence: true
  validates :count, presence: true
  validates_uniqueness_of :isbn, confirmation: { case_sensitive: false }
  has_many :bookmark, dependent: :destroy
  has_many :checkout, dependent: :destroy
  has_many :hold_request, dependent: :destroy
  has_many :special_book, dependent: :destroy
  mount_uploader :cover, CoverUploader
end


