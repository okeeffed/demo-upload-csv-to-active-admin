class Template < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :author, presence: true
end
