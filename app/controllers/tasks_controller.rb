class TasksController < ApplicationController
  def new
    @task = Task.new
    @memberships = Membership.find(params[:membership_id])
    @group = @memberships.group
  end

  def create
    @memberships = Membership.find(params[:membership_id])
    @task = @memberships.tasks.create!(task_params)
    @group = @memberships.group
    redirect_to group_members_path(@group)
  end

  def edit
    @memberships = Membership.find(params[:membership_id])
    @group = @memberships.group
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    memberships = Membership.find(params[:membership_id])
    group = memberships.group
    redirect_to group_members_path(group)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    memberships = Membership.find(params[:membership_id])
    group = memberships.group
    redirect_to group_members_path(group)
  end

  private
  def task_params
    params.require(:task).permit(:task, :due_by)
  end


end
