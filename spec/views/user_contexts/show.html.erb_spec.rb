require 'rails_helper'

RSpec.describe "user_contexts/show", type: :view do
  before(:each) do
    @user_context = assign(:user_context, UserContext.create!(
      :value => "MyText",
      :context => "",
      :user => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
