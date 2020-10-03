class PaymentsController < ApplicationController
	before_action :set_payment, only: %i[show update destroy]

  def index
    @payments = Payment.all
    json_response(@payments)
  end

  def create
    @payment = Payment.create!(payment_params)
    json_response(@payment, :created)
  end

  def show
    json_response(@payment)
  end

  def update
    @payment.update(payment_params)
    head :no_content
  end

  def destroy
    @payment.destroy
    head :no_content
  end

  private

  def payment_params
  	group_member = GroupMember.find(params[:group_member_id])
    params.require(:payment).permit(:payment_status, :owe_to_group_member_id).tap do |gm|
      gm.merge! group_member: group_member
    end
  end

  def set_payment
  	group_member = GroupMember.find(params[:group_member_id])
  	@payment = group_member.payments.find(params[:id])
  end
end
