class Admin::ProjectsController < ApplicationController
  before_action :load_project, except: [:index, :new, :create]

  def index
    @projects = Project.newest.page(params[:page]).
      per Settings.pagination.per_page
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new project_params
    if @project.save
      flash[:success] = t "flash.susscess.create_project"
      redirect_to admin_projects_path
    else
      flash[:danger] = t "flash.danger.created_project"
      render :new
    end
  end

  def update
    if @project.update_attributes project_params
      flash.now[:success] = t "flash.success.updated_project"
      redirect_to admin_projects_path
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
    redirect_to admin_projects_path
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
      redirect_to admin_projects_path
    end
  end
end
