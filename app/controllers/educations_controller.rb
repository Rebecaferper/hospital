class EducationsController < ApplicationController
  before_action :set_doctor, only: %i[new create]

  def new
    @education = Education.new # Needed to instantiate the form_with
  end

  def create
    @education = Education.new(education_params)
    @education.doctor = @doctor
    @education.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to doctor_path(@education.doctor)
  end

  def edit
    @education = Education.find(params[:id])
  end

  def update
    @education = Education.find(params[:id])
    @education.update(education_params)
    redirect_to doctor_path(@education.doctor)
  end

  private
  
  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def education_params
  params.require(:education).permit(:university, :degree_name, :score)
  end
end
