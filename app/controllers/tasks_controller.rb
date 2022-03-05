class TasksController < ApplicationController
  
  # before action
  before_action :authenticate_user!
  before_action :get_category, except: [:due_today, :backlog]
  before_action :get_task, only: [:show, :edit, :update, :destroy]

  # def today
  # @tasks = current_user.tasks.where(deadline: Date.today)
  # end

  def due_today
    # @tasks = @category.tasks.where(deadline: Date.today)
    if params[:sort] == "due_today_ongoing"
      @tasks = current_user.tasks.where(deadline: Date.current).order('status ASC').and(current_user.tasks.where(status: "On-going"))
    elsif params[:sort] == "due_today_pending"
      @tasks = current_user.tasks.where(deadline: Date.current).order('status ASC').and(current_user.tasks.where(status: "Pending"))
    else
      @tasks = current_user.tasks.where(deadline: Date.current).order('status ASC').and((current_user.tasks.where(status: "Pending")).or((current_user.tasks.where(status: "On-going"))))
    # redirect_to tasks_due_today_path
    end
  end

  def backlog
    # byebug
    if params[:sort] == "backlog_ongoing"
      @tasks = current_user.tasks.where('deadline < ?', Date.current).order('status ASC').and(current_user.tasks.where(status: "On-going"))
    elsif params[:sort] == "backlog_pending"
      @tasks = current_user.tasks.where('deadline < ?', Date.current).order('status ASC').and(current_user.tasks.where(status: "Pending"))
    else
      @tasks = current_user.tasks.where('deadline < ?', Date.current).order('status ASC').and((current_user.tasks.where(status: "Pending")).or((current_user.tasks.where(status: "On-going"))))
    end
  end

  def index
    @category_id = params[:category_id]
    if params[:sort] == "task_status"
      @tasks = @category.tasks.order('status ASC')
      # @tasks = current_user.categories.find(params[:category_id]).tasks.order('status ASC')
      # @tasks = Category.find(params[:category_id]).tasks.order('status ASC')
    elsif params[:sort] == "specific_category_tasks_today"
      @tasks = @category.tasks.where(deadline: Date.current).and((@category.tasks.where(status: "Pending")).or((@category.tasks.where(status: "On-going"))))
    elsif params[:sort] == "specific_category_tasks_pending"
      @tasks = @category.tasks.order('deadline ASC').where(status: "Pending")
    elsif params[:sort] == "specific_category_tasks_ongoing"
      @tasks = @category.tasks.order('deadline ASC').where(status: "On-going")
    elsif params[:sort] == "specific_category_tasks_done"
      @tasks = @category.tasks.order('deadline ASC').where(status: "Done")
    else
      @tasks = @category.tasks.order('deadline ASC')
      # @tasks = current_user.categories.find(params[:category_id]).tasks
      # @tasks = Category.find(params[:category_id]).tasks      
    end
  end


  def show
    # @task = Task.find(params[:id])
    # query buong task table, no assurance na sa specific category siya

    # @task = @category.tasks.find(params[:id])
    # alam niya na yung specific category
  end

  def new
    @task = @category.tasks.build
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
    # @task = Task.find(params[:id])
    # @task = current_user.tasks.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    # @task = current_user.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to category_tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # @task = Task.find(params[:id])
    # @task = current_user.tasks.find(params[:id])

    @task.destroy
    redirect_to category_tasks_path, notice: 'Task was successfully deleted.'
  end

  private

  def get_category
    # @category = Category.find(params[:category_id])
    @category = current_user.categories.find(params[:category_id])
  end

  def get_task
    @task = @category.tasks.find(params[:id])
    # SELECT tasks.* FROM tasks
    # WHERE task.category_id = 5
    # AND tasks.id = 2
  end

  def task_params
    params.require(:task).permit(:task_name, :task_body, :deadline, :status).merge(user_id: current_user.id)
    # :category_id, :user_id,
  end
end


# console
# Task.where(deadline: Date.today)
# @tasks = Task.where(deadline: Date.today)
# @tasks - Task.where('deadline > ?', Date.yesterday)