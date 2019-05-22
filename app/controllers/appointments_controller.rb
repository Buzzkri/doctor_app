class AppointmentsController < ApplicationController
  before_action :set_patient

  def index
    @doctors = @doctor.appointments.where(date: 'teacher')
    # @tas = @doctor.appointments.where(role: 'ta')
    @patients = @doctor.appointments.where(role: 'student')
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_appointments_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to patient_appointments_path(@doctor)
  end

 private
   def set_patient
     @doctor = Patient.find(params[:patient_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(:date, :doctor_id)
   end
end