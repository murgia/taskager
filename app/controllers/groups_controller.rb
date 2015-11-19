class GroupsController < ApplicationController
  # Could use a before filter to make dry
  before_action :set_group, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all
    @group = Group.new
  end

  def create
    @group = Group.create!(group_params)
    redirect_to(groups_path)
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to groups_path
  end

  def destroy
    @group.destroy
    redirect_to groups_path
    end

  private
  def group_params
    params.require(:group).permit(:title, :photo_url)
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
