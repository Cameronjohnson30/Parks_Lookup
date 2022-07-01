require "rails_helper"

describe "delete a quote route", :type => :request do
  before do
    @park = Park.create!(:name => "test_name", :managed_by => "state", :description => "test_desctiption")
    delete "/parks/#{@park.id}", params: { :name => "test_name", :managed_by => @random, :description => "test_desctiption" }
  end

  it "deletes the quote" do
    expect(response).to have_http_status(202)
    expect(JSON.parse(response.body)["message"]).to eq("This park has been successfully deleted.")
  end
end
