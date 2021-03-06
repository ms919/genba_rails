class TasksController < ApplicationController
  before_action :get_task, only: [:show, :edit, :update, :destroy ]

  def index
    @tasks = current_user.tasks.recent
    logger.debug "[row]tasks: #{@tasks}"
    logger.debug "[inspect]tasks: #{@tasks.inspect}"
    logger.debug "[yaml]tasks: #{@tasks.to_yaml}"
    # logger.debug "[inspect]tasks: #{@tasks.attributes.inspect}"
  end

  def show
  end

  def edit
  end

  def update
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def destroy
    @task.destroy!
    redirect_to tasks_path, notice: "タスク「#{@task.name}」を削除しました。"
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end

  def get_task
    @task = current_user.tasks.find(params[:id])
  end
end
