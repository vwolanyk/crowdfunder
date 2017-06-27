class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.page(params[:page]).per(10)
    @projects = @projects.order(:end_date)
  end

  def show
    if current_user
      @project = Project.find(params[:id])
      @pledge = Pledge.new
      @comment = Comment.new
    else

      redirect_back_or_to projects_path , notice: "You must Login or Register to View Projects"

  end
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)
    @project.owner = current_user

    @project.avatar = params[:project][:avatar]

    if @project.save

      redirect_to projects_url
    else
      render :new
    end
   end

   def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:alert] = "The Project has been updated"
      redirect_to projects_path(@project.id)
    else
      redirect_back_or_to @project
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :avatar)
  end
end
