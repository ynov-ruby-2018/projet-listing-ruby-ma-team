class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @announcements = Announcement.my_search(params[:search],params[:category_id]);
  end

  def new
    @announcement = Announcement.new
    @categories = Category.all
  end

  def create
    announcement = Announcement.new(announcement_params)

    # Handle file upload.
    uploaded_io = params[:announcement][:picture]
    if(uploaded_io != nil)
      extension = uploaded_io.original_filename.split.last
      relative_filemane = "images/#{Random.new.rand(0..100000000000)}-#{Date.new}.#{extension}"
      filename = Rails.root.join('public',relative_filemane)
      File.open(filename, 'wb') do |file|
        file.write(uploaded_io.read)
      end

      announcement.picture = "/#{relative_filemane}"
    end

    announcement.user = current_user

    # And save
    announcement.save!
    redirect_to announcements_path
  end

  def announcement_params
    params.require(:announcement).permit(:title,:description,:price,:category_id)
  end
end
