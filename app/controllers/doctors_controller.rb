class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new # Needed to instantiate the form_with
  end

  def create
    @doctor = Doctor.new(params[:doctor])
    @doctor.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to doctor_path(@doctor)
  end

  private

  def doctor_params
  params.require(:doctor).permit(:first_name, :last_name, :specialty)
  end
end
