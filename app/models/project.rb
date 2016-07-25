class Project < ActiveRecord::Base
    validates :title, presence: true
    validates :start_date, presence: true
    validates :end_time, presence: true
    validates :sponsor_id, presence: true
    validates :goal, presence: true
    validates :title, uniqueness: {case_sensitive: false}
    validate :end_time_validate

    belongs_to :sponsor
    has_many :people_projects
    has_many :users, through: :people_projects

    def create(project_params, user_params)
        Project.transaction do
            PeopleProject.transaction do
                project = Project.create!(project_params)
                user_params.each do |user_id|
                    user = user.find_by_id(user_id)
                    if (user.nil?)
                        raise ActiveRecord::Rollback
                    end
                    PeopleProject.create!([user_id: user_id, project_id: project.id])
                end
            end
        end
    end

    def update_with_user(project_params, user_params)
        Project.transaction do
            PeopleProject.transaction do
                project = self.update(project_params)


                people_projects = PeopleProject.find_by(project_id: self.id)
                if not people_projects.nil?
                    people_projects.destroy_all
                end

                user_params[:user_id].each do |user_id|
                    people_project = PeopleProject.find_by(user_id: user_id, project_id: self.id)

                    # byebug
                    user = User.find_by_id(user_id)
                    if (not user.nil?)
                        raise ActiveRecord::Rollback
                    end
                    PeopleProject.create!([user_id: user_id, project_id: self.id])
                    # byebug

                end
            end
        end
        # byebug
    end

    # private
    def end_time_validate
        # byebug
        if start_date.presence && end_time.presence && start_date >= end_time

            errors.add(:end_time, "must be greater than start date")
        end
    end
end
