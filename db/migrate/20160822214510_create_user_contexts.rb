class CreateUserContexts < ActiveRecord::Migration
    def change
        create_table :user_contexts, :id => false do |t|
            t.string :value
            t.references :context
            t.references :user

            t.timestamps null: false
        end

        add_index(:user_contexts, [:user_id, :context_id])
    end
end
