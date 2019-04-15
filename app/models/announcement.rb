class Announcement < ApplicationRecord
  belongs_to :category
  has_many :index
  belongs_to :user
end
