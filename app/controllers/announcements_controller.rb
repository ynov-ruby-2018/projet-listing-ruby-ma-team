class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.my_search(params[:search],params[:category_id]);
  end
end
