class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      flash.now[:alert] = "Failed to update task"
      render 'edit'
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
