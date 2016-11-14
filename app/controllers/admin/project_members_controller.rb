class Admin::ProjectMembersController < ApplicationController
  before_action :load_project, except: [:index, :new, :create]

  def index
    @users = User.all
    @projects = Project.all
    @project_members = ProjectMember.page(params[:page])
      .per Settings.pagination.per_page
  end

  def new
    @users= User.all
    @projects = Project.all
    @project_member = ProjectMember.new
  end

  def edit
    @users = User.all
    @projects = Project.all
  end

  def create
    @project_member = ProjectMember.new project_member_params
    if @project_member.save
      flash[:success] = t "flash.susscess.create_project_member"
      redirect_to admin_project_members_path
    else
      flash[:danger] = t "flash.danger.created_project_member"
      render :new
    end
  end

  def update
    if @project_member.update_attributes project_member_params
      flash.now[:success] = t "flash.success.updated_project_member"
      redirect_to admin_project_members_path
    else
      flash.now[:danger] = t "flash.danger.updated_project_members"
      render :edit
    end
  end

  def destroy
    if @project_member.destroy
      flash.now[:success] = t "flash.success.deleted_project"
    else
      flash.now[:danger] = t "flash.danger.deleted_project"
    end
    redirect_to admin_project_members_path
  end

  private
  def project_member_params
    params.require(:project_member).permit :user_id, :project_id, :project_role
  end

  def load_project
    @project_member = ProjectMember.find_by id: params[:id]
    unless @project_member
      flash.now[:danger] = t "flash.danger.project_not_found"
      redirect_to admin_project_members_path
    end
  end
end
