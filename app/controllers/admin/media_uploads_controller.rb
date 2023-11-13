class Admin::MediaUploadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_media_upload, only: [:show, :edit, :destroy]

  layout "admin"

  def index
    @media_uploads = MediaUpload.all.includes(:media_file_attachment)
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
        format.html { redirect_to admin_media_uploads_path, notice: t(".new_media_uploads") }
      else
        format.turbo_stream
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @media_upload.destroy
    respond_to do |format|
      format.html { redirect_to admin_media_uploads_path, notice: "Media upload was successfully destroyed." }
    end
  end

  private

  def media_upload_params
    params.require(:media_upload).permit(:name, :description, :media_file, :tag_list)
  end

  def set_media_upload
    @media_upload = MediaUpload.find(params[:id])
  end
end
