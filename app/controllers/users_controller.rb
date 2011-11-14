class UsersController < ApplicationController

  def view
    @user = User.find params[:user_id]

    respond_to do |format|
      format.html
      format.json{ render json: @user}
    end
  end

  def search
    @user_name = params[:user_name] ||= ''

    @users = User.search_by_name @user_name

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

end
