class Project < ApplicationRecord
  has_many :project_members
  has_many :users, through: :project_members

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :name, presence: true, length: Settings.maximum.length
  validates :abbreviation, presence: true, length: Settings.maximum.length
  scope :newest, ->{order created_at: :desc}
end
