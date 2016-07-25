require 'rails_helper'

RSpec.describe "publications/new", type: :view do
    before(:each) do
        assign(:journals , [Fabricate(:journal)])
        assign(:publishers , [Fabricate(:publisher)])
        assign(:publication, Fabricate.build(:publication))
    end


    it "renders new publication form" do
        render

        assert_select "form[action=?][method=?]", publications_path, "post" do

            assert_select "input#publication_title[name=?]", "publication[title]"

            assert_select "input#publication_year[name=?]", "publication[year]"

            assert_select "select#publication_publisher_id[name=?]", "publication[publisher_id]"

            assert_select "input#publication_page[name=?]", "publication[page]"

            assert_select "input#publication_volume[name=?]", "publication[volume]"

            assert_select "select#publication_journal_id[name=?]", "publication[journal_id]"
        end
    end
end
