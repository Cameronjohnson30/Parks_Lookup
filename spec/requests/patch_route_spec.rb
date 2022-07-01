require "rails_helper"

describe "edit a park route", :type => :request do
  before do
    @park = Park.create!(:name => "test_author", :managed_by => "State", :description => "test_content")
    patch "/parks/#{@park.id}", params: { :name => "new_author", :managed_by => "State", :description => "new_content" }

  end

  it "updates the name, and description" do
    get "/parks/#{@park.id}"
    puts JSON.parse(response.body)
    expect(JSON.parse(response.body)["name"]).to eq("new_author")
    expect(JSON.parse(response.body)["description"]).to eq("new_content")
  end

  it "returns a updated status" do
    expect(response).to have_http_status(:ok)
  end
end

describe "exceptions work as expected", :type => :request do
  it "throws error if name and description field is empty" do
    @park = Park.create!(:name => "test_author", :managed_by => "State", :description => "gdfddhhd")
    patch "/parks/#{@park.id}", params: { :name => "",:managed_by => "State", :description => "" }
    expect(response).to have_http_status(422)
    expect(JSON.parse(response.body)["message"]).to eq("Validation failed: Name can't be blank, Description can't be blank")
  end
end
