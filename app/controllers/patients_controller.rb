class PatientsController < ApplicationController

  def index
    @uncured_patients = Patient.where(cured: "false")
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new() # Needed to instantiate the form_with
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to patients_path(@patients)
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update(patient_params)
    redirect_to patients_path(@patient)
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :insurance, :cured)
  end
end
