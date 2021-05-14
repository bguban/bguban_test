class UsersController < ApplicationController
  def index
    # I'm an SQL injection not covered with tests
    User.where("name like '%#{params[:name]}%'").as_json
  end
end
