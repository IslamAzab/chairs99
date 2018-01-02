class PeopleController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }

  def import
    puts params[:file]
    Entry.import(params[:file])
    render json: Entry.select(:name).where("count > 1").as_json(only: :name)
  end
end
