class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.my_search(params[:search],params[:category_id]);
  end

  def new
    @announcement = Announcement.new
  end

  before_action :authenticate_user!

  def create
    announcement = Announcement.new(announcement_params)

    # Handle file upload.
    uploaded_io = params[:announcement][:picture]
    extension = uploaded_io.original_filename.split.last
    relative_filemane = "images/#{Random.new.rand(0..100000000000)}-#{Date.new}.#{extension}"
    filename = Rails.root.join('public',relative_filemane)
    File.open(filename, 'wb') do |file|
      file.write(uploaded_io.read)
    end

    # Add missing fields.
    announcement.picture = "/#{relative_filemane}"
    announcement.user = current_user
    announcement.category_id = 1

    # And save
    announcement.save!
  end

  def announcement_params
    params.require(:announcement).permit(:title,:description,:price)
  end
end
