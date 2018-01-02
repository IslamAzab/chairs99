require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe "POST import" do

    before(:each) do
      csv_file = fixture_file_upload('files/single_repetition.csv', 'multipart/form-data')
      post :import, params: {file: csv_file}
    end

    it "should be successful" do
      response.should be_success
    end

    it "accepts CSV file" do
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.first["name"]).eql?("aaa")
    end

    it "returns a JSON object containing all first names which occur more than once and their count" do
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.first["name"]).eql?("aaa")
    end
  end
end