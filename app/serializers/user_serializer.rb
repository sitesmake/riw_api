class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :age

  def age
    object.age >= 18 ? "adult" : "minor"
  end
end
