class Admin::ProjectMembersController < ApplicationController

  def index
    @projects = Project.all
    @project_members = ProjectMember.page(params[:page])
      .per Settings.pagination.per_page
  end

  def new
    @users= User.all
    @projects = Project.all
    @project_member = ProjectMember.new
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
      redirect_to admin_project_member_path
    else
      flash.now[:danger] = t "flash.danger.updated_project_members"
      render :edit
    end
  end

  private
  def project_member_params
    params.require(:project_member).permit :user_id, :project_id, :project_role
  end
end
