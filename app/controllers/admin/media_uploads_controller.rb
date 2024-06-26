class Admin::MediaUploadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_media_upload, only: [:edit, :update, :destroy]

  layout 'admin'

  def index
    @media_uploads = MediaUpload.all
      .includes([:media_file_attachment, :media_file_blob, :taggings])
  end

  def new
    @media_upload = MediaUpload.new
  end

  def create
    @media_upload = MediaUpload.new(media_upload_params)

    respond_to do |format|
      if @media_upload.save
        format.html { redirect_to admin_media_uploads_path, notice: t('.new_media_uploads') }
      else
        # Log the validation errors
        Rails.logger.debug @media_upload.errors.full_messages.join(', ')
        format.turbo_stream
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @media_upload.update(media_upload_params)
        format.html { redirect_to admin_media_uploads_path, notice: t('.update_media_uploads') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @media_upload.media_file.purge
    @media_upload.destroy
    respond_to do |format|
      format.html { redirect_to admin_media_uploads_path, notice: t('.destroyed_media_uploads') }
    end
  end

  private

  def media_upload_params
    params.require(:media_upload).permit(:name, :description, :media_file, :tag_list)
  end

  def set_media_upload
    @media_upload = MediaUpload.friendly.find(params[:id])
  end
end
