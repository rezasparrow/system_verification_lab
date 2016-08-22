require 'rails_helper'

RSpec.describe "user_contexts/new", type: :view do
  before(:each) do
    assign(:user_context, UserContext.new(
      :value => "MyText",
      :context => "",
      :user => ""
    ))
  end

  it "renders new user_context form" do
    render

    assert_select "form[action=?][method=?]", user_contexts_path, "post" do

      assert_select "textarea#user_context_value[name=?]", "user_context[value]"

      assert_select "input#user_context_context[name=?]", "user_context[context]"

      assert_select "input#user_context_user[name=?]", "user_context[user]"
    end
  end
end
