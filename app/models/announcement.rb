class Announcement < ApplicationRecord
  belongs_to :category
  has_many :messages
end
