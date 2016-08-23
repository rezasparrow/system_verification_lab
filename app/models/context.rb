class Context < ActiveRecord::Base
    has_many :role_contexts
    has_many :roles , through: :user_contexts
end
