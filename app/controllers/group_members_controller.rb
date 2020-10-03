class GroupMembersController < ApplicationController
	before_action :set_group_member, only: %i[show update destroy]

  def index
    @group_members = GroupMember.all
    json_response(@group_members)
  end

  def create
    @group_member = GroupMember.create!(group_member_params)
    json_response(@group, :created)
  end

  def show
    json_response(@group_member)
  end

  def update
    @group_member.update(group_member_params)
    head :no_content
  end

  def destroy
    @group_member.destroy
    head :no_content
  end


  private

  def group_member_params
  	group = Group.find(params[:group_id])
    params.require(:group_member).permit(:user_id).tap do |gm|
      gm.merge! group: group
    end
  end

  def set_group_member
    group = Group.find(params[:group_id])
    @group_member = group.group_members.find(params[:id])
  end
end




