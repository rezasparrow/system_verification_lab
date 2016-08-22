require 'rails_helper'

RSpec.describe "user_contexts/index", type: :view do
  before(:each) do
    assign(:user_contexts, [
      UserContext.create!(
        :value => "MyText",
        :context => "",
        :user => ""
      ),
      UserContext.create!(
        :value => "MyText",
        :context => "",
        :user => ""
      )
    ])
  end

  it "renders a list of user_contexts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
