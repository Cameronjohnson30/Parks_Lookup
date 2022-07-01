require "rails_helper"

describe "post a quote route", :type => :request do
  before do
    post "/parks", params: { :name => "test_name", :managed_by => "State", :description => "test_content" }
  end

  it "returns the name of the park" do
    expect(JSON.parse(response.body)["name"]).to eq("test_name")
  end

  it "returns the managed by for the park" do
    expect(JSON.parse(response.body)["managed_by"]).to eq("State")
  end

  it "returns the quote description" do
    expect(JSON.parse(response.body)["description"]).to eq("test_content")
  end

  it "returns a created status" do
    expect(response).to have_http_status(:created)
  end
end

describe "exceptions work as expected", :type => :request do
  it "throws error if name field is empty" do
    post "/parks", params: { :name => "", :managed_by => "State", :description => "test_content" }
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Name can't be blank")
  end
  
  it "throws error if description field is empty" do
    post "/parks", params: { :name => "cam", :managed_by => "State", :description => ""}
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Description can't be blank")
  end

  it "throws an error if managed_by is empty" do
    post "/parks", params: { :name => "cam", :managed_by => "", :description => "afgfgagagf"}
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Managed by can't be blank")
  end
end
