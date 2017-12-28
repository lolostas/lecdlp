class AppointmentsController < ApplicationController

  # POST /conversation/:conversation_id/appointments
  def create
    conversation = Mailboxer::Conversation.find(params[:conversation_id])
    recipients = conversation.recipients

    @appointment = Appointment.new(appointment_params)
    @appointment.destinator = recipients.first
    @appointment.creator = recipients.last
    @appointment.save

    receipt = current_user.reply_to_conversation(
      conversation,
      "Message automatique : RDV le #{@appointment.date.strftime('%e %b %y')}, à #{@appointment.location}"
    )

    redirect_to conversation_path(conversation), notice: "All good :)"
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :location)
  end
end

