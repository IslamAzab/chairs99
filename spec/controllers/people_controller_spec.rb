require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe "POST import" do
    it "accepts CSV file" do
      csv_file = fixture_file_upload('files/single_repetition.csv', 'multipart/form-data')
      post :import, params: {file: csv_file}
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.first["name"]).eql?("aaa")
    end
  end
end