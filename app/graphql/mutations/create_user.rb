module Mutations
  class CreateUser < BaseMutation
    null false

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::UserType

    def resolve(name: nil, email: nil, password: nil)
      User.create!(
          name: name,
          email: email,
          password: password,
      )
    end
  end
end