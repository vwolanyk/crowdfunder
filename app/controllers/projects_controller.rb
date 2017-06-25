class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.page(params[:page]).per(10)
    @projects = @projects.order(:end_date)
  end

  def show
    @project = Project.find(params[:id])
    @pledge = Pledge.new
    @owner = @project.owner
    @comment = Comment.new
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)
    @project.owner = current_user

    if @project.save

      redirect_to projects_url
    else
      render :new
    end
   end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :image)
  end
end
