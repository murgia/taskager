class TasksController < ApplicationController
  def new
    @task = Task.new
    @memberships = Membership.find(params[:membership_id])
  end

  def create
    @memberships = Membership.find(params[:membership_id])
    @task = @memberships.tasks.create!(task_params)
    @group = @memberships.group
    redirect_to group_members_path(@group)
  end

  def edit
    @memberships = Membership.find(params[:membership_id])
    @task = @memberships.task.find(params(:id))
  end

  def update
  end

  def destroy
  end

  private
  def task_params
    params.require(:task).permit(:task, :due_by)
  end


end
