class TasksController < ApplicationController
  before_action :set_task, only: %i(show edit update destroy)

  def index
    @tasks=Task.all
  end

  def show;end

  def new
    @task=Task.new
  end

  def create
    task=Task.new(task_params)
    task.save!
    redirect_to tasks_path, notice: "タスク「#{task.name}」を登録しました。"
  end

  def edit;end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を更新しました。"
    else
      flash.now = 'hogehoge'
      render :edit
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

  def set_task
    @task=Task.find(params[:id])
  end
end
