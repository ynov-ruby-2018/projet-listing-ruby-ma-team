class Announcement < ApplicationRecord
  belongs_to :category
  has_many :index
  belongs_to :user

  def self.my_search(needle=nil, category_id=nil)
    if !needle.nil? && needle != ''
      @result = Announcement.where(["title LIKE :needle OR description LIKE :needle", {:needle => "%#{needle}%"}])
    else
      @result = Announcement.all
    end
    if category_id != nil
      @result.where!('category_id': category_id)
    end
    @result
  end
end
