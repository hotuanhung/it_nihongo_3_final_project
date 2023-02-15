class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true
  validates :education_level, presence: true
  validates :university, presence: true
  validates_uniqueness_of :email, confirmation: { case_sensitive: false }
  validates_format_of :email, uniqueness: true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :password, confirmation: true, length: { minimum: 8 }
  has_many :bookmark, dependent: :destroy
  has_many :checkout, dependent: :destroy
  has_many :hold_request, dependent: :destroy
  has_many :special_book, dependent: :destroy
end
