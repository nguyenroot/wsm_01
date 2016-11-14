class ProjectMembersController < ApplicationController
  before_action :load_project_member, except: [:index, :new, :create]
  before_action :load_user, only: [:new, :edit]
  before_action :load_project, only: [:new, :edit]

  def index
    @project_members = ProjectMember.newest.page(params[:page])
      .per Settings.pagination.project_member_per_page
  end

  def new
    @project_members = ProjectMember.all
    @project_member = ProjectMember.new
  end

  def edit
  end

  def create
    error_count = 0
    params[:project_member][:user_id].each do |user_id|
      @project_member = ProjectMember.new project_member_params.
        merge user_id: user_id
      error_count += 1 unless @project_member.save
    end
    if error_count
      load_project
      load_user
      render :new
    else
      redirect_to project_members_path
    end
  end


  def update
    if @project_member.update_attributes project_member_params
      flash.now[:success] = t "flash.success.updated_project_member"
      redirect_to project_members_path
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
    redirect_to project_members_path
  end

  private
  def project_member_params
    params.require(:project_member).permit :project_id, :project_role
  end

  def load_project_member
    @project_member = ProjectMember.includes(:user, :project).
      find_by_id params[:id]
    unless @project_member
      flash.now[:danger] = t "flash.danger.project_not_found"
      redirect_to project_members_path
    end
  end

  def load_user
    @users = User.all
  end

  def load_project
    @projects = Project.all
  end
end
