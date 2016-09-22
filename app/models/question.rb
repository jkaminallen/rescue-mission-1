class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  # validates :title, numericality: true, length: {minimum: 40}
  validates :title, length: { minimum: 40 }, presence: true
  # validates :description, numericality: true, length: {minimum: 150}
  validates :description, length: { minimum: 150 }, presence: true

end
