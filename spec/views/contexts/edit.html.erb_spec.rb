require 'rails_helper'

RSpec.describe "contexts/edit", type: :view do
  before(:each) do
    @context = assign(:context, Context.create!(
      :name => "MyString",
      :type => "",
      :location => "MyString",
      :role => ""
    ))
  end

  it "renders the edit context form" do
    render

    assert_select "form[action=?][method=?]", context_path(@context), "post" do

      assert_select "input#context_name[name=?]", "context[name]"

      assert_select "input#context_type[name=?]", "context[type]"

      assert_select "input#context_location[name=?]", "context[location]"

      assert_select "input#context_role[name=?]", "context[role]"
    end
  end
end
