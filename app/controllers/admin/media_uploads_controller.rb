class Admin::MediaUploadsController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  def index
    @media_uploads = MediaUpload.all
  end

  def show
  end

  def new
    @media_upload = MediaUpload.new
  end

  def create
    @media_upload = MediaUpload.new(media_upload_params)

    respond_to do |format|
      if @media_upload.save
        format.html { redirect_to admin_media_uploads_path, notice: "Media upload was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def media_upload_params
    params.require(:media_upload).permit(:name, :description, :media_file)
  end
end
