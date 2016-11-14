class ProjectMember < ApplicationRecord
  belongs_to :user
  belongs_to :project

  enum project_role: {leader: 0, member: 1}
  scope :newest, ->{order created_at: :desc}
end
