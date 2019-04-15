class Announcement < ApplicationRecord
  belongs_to :category
  has_many :messages
  belongs_to :user
end
