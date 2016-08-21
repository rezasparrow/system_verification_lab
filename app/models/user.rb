class User < ActiveRecord::Base
    # validates :avatar, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    rolify
    has_attached_file :avatar,
                      styles: {
                          medium: "300x300>",
                          thumb: "100x100>"}, default_url: "/images/:style/missing.jpg"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_many :people_projects
    has_many :projects, through: :people_projects
    has_many :user_publications
    has_many :publications, through: :user_publications


    def full_name
        return first_name+ " " + last_name
    end

end
