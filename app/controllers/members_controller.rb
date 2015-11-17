class MembersController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @members = @group.members.all
  end

  private
  def member_params
    params.require(:member).permit(:name, :image_url)
  end

end
