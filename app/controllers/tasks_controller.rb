class TasksController < ApplicationController
  
  # def index
  #   # @tasks = Task.all
  #   @category_id = params[:category_id]
  #   @tasks = Category.find(params[:category_id]).tasks

  # end

  # def show
  #   @task = Task.find(params[:id])
  # end

  # def new
  #   @task = @category.tasks.build
  #   #  .build para sa association ng has many
  # end

  # def create
  #   @task = @category.tasks.build(task_params)

  #   if @task.save
  #     redirect_to category_tasks_path, notice: 'Task was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  # def edit
  #   @task = Task.find(params[:id])
  # end

  # def update
  #   @task = Task.find(params[:id])

  #   if @task.update(task_params)
  #     redirect_to category_tasks_path, notice: 'Task was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @task = Task.find(params[:id])

  #   @task.destroy
  #   redirect_to category_tasks_path, notice: 'Task was successfully deleted.'
  # end

  # private

  # def task_params
  #   params.require(:task).permit(:task_name, :task_body, :category_id)
  # end

  # before action
  before_action :get_category

  def index
    @category_id = params[:category_id]
    @tasks = Category.find(params[:category_id]).tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = @category.tasks.build
    #  .build para sa association ng has many
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to category_tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    redirect_to category_tasks_path, notice: 'Task was successfully deleted.'
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:task_name, :task_body, :category_id)
  end
end
