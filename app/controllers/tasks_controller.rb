class TasksController < ApplicationController
  before_filter :authorize, only: [:edit, :new, :destroy, :index]
  helper_method :sort_column, :sort_direction

  def index
    @tasks = current_user.tasks.order(sort_column + " " + sort_direction)
    @task = Task.new
  end

  def show
  end

  def edit
    @task = Task.find(params[:id])
  end

  def new
  end

  def create
    @task = current_user.tasks.build(task_params).set_maximum_priority
    @task.complete = false


    respond_to do |format|
      if @task.save
        format.js
      else
        format.js
      end
    end
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { head :no_content }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to {|format| format.js }
  end

  private

  def task_params
    params.require(:task).permit(:id, :title, :due_date, :priority, :complete)
  end

  def sort_column
    params[:sort] || "id"
  end

  def sort_direction
    params[:direction] || "asc"
  end

end
