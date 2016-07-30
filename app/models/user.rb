class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :people_projects
  has_many :projects, through: :people_projects
  has_many :user_publications
  has_many :publications, through: :user_publications

end
