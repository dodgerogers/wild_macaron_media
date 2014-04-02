require "spec_helper"

describe "Errors" do
  it "renders 404" do
    visit "/foo"
    page.should have_content "404 This is not the page you were looking for"
  end
end
