class TasksController < ApplicationController
  
  # before action
  before_action :authenticate_user!
  before_action :get_category

  def index
    @category_id = params[:category_id]
    if params[:sort] == "deadline"
      @tasks = Category.find(params[:category_id]).tasks.order('deadline ASC')
    elsif params[:sort] == "task_status"
      @tasks = Category.find(params[:category_id]).tasks.order('status ASC')
    # elsif params[:sort] == "status_done"
    #   @tasks = Category.find(params[:category_id]).includes(:tasks).where(tasks.status = 'done')
    else
      @tasks = Category.find(params[:category_id]).tasks
    end
  end

  def show
    # @task = Task.find(params[:id])
    # query buong task table, no assurance na sa specific category siya

    @task = @category.tasks.find(params[:id])
    # alam niya na yung specific category
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
    params.require(:task).permit(:task_name, :task_body, :category_id, :user_id, :deadline, :status)
  end
end
