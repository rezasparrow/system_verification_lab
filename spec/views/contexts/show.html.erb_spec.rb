require 'rails_helper'

RSpec.describe "contexts/show", type: :view do
  before(:each) do
    @context = assign(:context, Context.create!(
      :name => "Name",
      :type => "Type",
      :location => "Location",
      :role => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(//)
  end
end
