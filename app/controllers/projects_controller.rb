class ProjectsController < ApplicationController
  before_action :load_projects, except: [:index, :new, :create]
  before_action :load_project, only: [:show]
  def index
    @projects = Project.newest.page(params[:page]).per Settings.pagination.project_per_page
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def show
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    if @project.update_attributes project_params
      flash.now[:success] = t "flash.success.updated_project"
      redirect_to projects_path
    else
      flash.now[:danger] = t "flash.danger.updated_project"
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash.now[:success] = t "flash.success.deleted_project"
    else
      flash.now[:danger] = t "flash.danger.deleted_project"
    end
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit :name, :abbreviation,
      :start_date, :end_date
  end

  def load_project
    @project = Project.find_by id: params[:id]
    unless @project
      flash.now[:danger] = t "flash.danger.project_not_found"
      redirect_to projects_path
    end
  end

  def load_projects
    @projects = Project.all
  end
end
