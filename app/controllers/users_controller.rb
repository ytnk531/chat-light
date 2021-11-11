class UsersController < ApplicationController
  def new
    @user = User.new
    cookies.encrypted[:user_id] = nil
  end

  def create
    @user = User.create!(user_params)
    cookies.encrypted[:user_id] = @user.id
    redirect_to new_chat_room_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name)
    end
end
