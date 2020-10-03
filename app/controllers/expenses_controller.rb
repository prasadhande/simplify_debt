class ExpensesController < ApplicationController
	before_action :set_expense, only: %i[show update destroy]

  def index
    @expenses = Expense.all
    json_response(@expenses)
  end

  def create
    @expense = Expense.create!(expense_params)
    json_response(@expense, :created)
  end

  def show
    json_response(@expense)
  end

  def update
    @expense.update(expense_params)
    head :no_content
  end

  def destroy
    @expense.destroy
    head :no_content
  end

  private

  def expense_params
  	group_member = GroupMember.find(params[:group_member_id])
    params.require(:expense).permit(:amount,:owe_to_group_member_id).tap do |gm|
      gm.merge! group_member: group_member
    end
  end

  def set_expense
    group_member = GroupMember.find(params[:group_member_id])
    @expense = group_member.expenses.find(params[:id])
  end
end
