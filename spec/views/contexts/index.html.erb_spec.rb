require 'rails_helper'

RSpec.describe "contexts/index", type: :view do
  before(:each) do
    assign(:contexts, [
      Context.create!(
        :name => "Name",
        :type => "Type",
        :location => "Location",
        :role => ""
      ),
      Context.create!(
        :name => "Name",
        :type => "Type",
        :location => "Location",
        :role => ""
      )
    ])
  end

  it "renders a list of contexts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
