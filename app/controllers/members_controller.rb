class MembersController < ApplicationController
  def index
    @members = Membership.find(params[:group_id])
  end

  private
  def member_params
    params.require(:member).permit(:name, :image_url)
  end

end
