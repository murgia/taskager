class MembersController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @memberships = @group.memberships
  end

  def new
    @member = Member.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @member = @group.members.create(member_params)
    redirect_to group_members_path(@group)
  end

  def edit
    @group = Group.find(params[:group_id])
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to group_members_path
  end

  def destroy
    @member = Member.find(params[:id])

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

end
