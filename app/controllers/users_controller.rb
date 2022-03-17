class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  def index
    @users = OrderedUsersQuery.new(sort_query_params)

    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    binding.pry

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :age)
    end

    def sort_query_params
      params.slice(:sort_by, :direction)
    end
end
