class MembersController < ApplicationController
  # Same comment as groups_controller.rb
  before_action :set_group, only: [:index, :create, :edit]
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    @memberships = @group.memberships
    @member = Member.new
  end

  def create
    @member = @group.members.create(member_params)
    redirect_to group_members_path(@group)
  end

  def edit
  end

  def update
    @member.update(member_params)
    redirect_to group_members_path
  end

  def destroy
    @member.memberships.each do |membership|
      membership.tasks.destroy_all
      membership.destroy
    end
    @member.destroy
    redirect_to group_members_path
  end


  private
  def member_params
    params.require(:member).permit(:name, :image_url)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_member
    @member = Member.find(params[:id])
  end

end
