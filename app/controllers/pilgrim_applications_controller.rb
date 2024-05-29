class PilgrimApplicationsController < ApplicationController
  def new
    @pilgrim_application = PilgrimApplication.new
    @pilgrim_application.pilgrims.build.churches.build
  end

  def create
    @pilgrim_application = PilgrimApplication.new(pilgrim_application_params)
    if @pilgrim_application.save
      redirect_to root_path, notice: "Pilgrim application submitted successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pilgrim_application_params
    params.require(:pilgrim_application).permit(
      pilgrims_attributes: [
        :first_name, :middle_name, :last_name, :nametag_name, :date_birth, :gender,
        :street_address, :city, :state, :zipcode, :email, :primary_phone, :alternative_phone, :work_phone,
        :occupation, :clergy, :musician, :followup_activities, :medication_time, :walk_explained, :health_condition,
        :physical_limitations, :short_notice, :emergency_name, :emergency_relationship, :emergency_primary_phone,
        :emergency_alternative_phone, :emergency_city, :allergies,
        churches_attributes: [:name, :city, :street_address, :state, :zipcode, :phone, :pastor, :church_email]
      ]
    )
  end
end
