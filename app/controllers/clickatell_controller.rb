# For Clickatell
class SmsController < ApplicationController

  def create
    sms = SMS.new(CLICKATELL_CONFIG)
    sms.create(params[:recipient], params[:message_text])
    flash[:notice] = "Message sent succesfully!"
    redirect_to :back

  rescue Clickatell::API::Error => e
    flash[:error] = "Clickatell API error: #{e.message}"
    redirect_to :back
  end

end
