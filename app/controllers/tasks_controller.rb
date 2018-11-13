class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @m = @task.completed ? "Task is completed" : "Task is not completed yet"
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(validate_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(validate_params)
    redirect_to task_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def validate_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
