class UserPresenter
  def initialize(user)
    @user = user
  end

  def drive_status
    age >= 16 ? "can drive a car" : "can't drive a car"
  end
end
