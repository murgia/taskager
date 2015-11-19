class TasksController < ApplicationController
  # Same comment as groups_controller.rb - didn't implement it here yet though
  before_action :set_memberships, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = Task.new
  end

  def create
    @task = @memberships.tasks.create!(task_params)
    @group = @memberships.group
    redirect_to group_members_path(@group)
  end

  def edit
    @group = @memberships.group
  end

  def update
    @task.update(task_params)
    group = @memberships.group
    redirect_to group_members_path(group)
  end

  def destroy
    @task.destroy
    group = @memberships.group
    redirect_to group_members_path(group)
  end

  private
  def task_params
    params.require(:task).permit(:task, :due_by)
  end

  def set_memberships
    @memberships = Membership.find(params[:membership_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
