require 'rails_helper'

RSpec.describe User, type: :model do

  context "uniqueness validation" do
    before do
    User.create(email: 'test@test.com', name: 'Mert Gunduz', password: '123456')
    end

    it "checks email" do
      expect {User.create!(email: 'test@test.com', name: 'Different name', password: '123456')}.to raise_error(ActiveRecord::RecordInvalid)
    end
  
    it "checks name" do
      expect {User.create!(email: 'different@mail.com', name: 'Mert Gunduz', password: '123456')}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "format and length validation" do

    it "checks email format" do
      expect {User.create!(email: 'test', name: 'Mert Gunduz', password: '123456')}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "checks name length" do
      expect {User.create!(email: 'test@test.com', name: 'M', password: '123456')}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "checks password length" do
      expect {User.create!(email: 'test@test.com', name: 'Mert Gunduz', password: '1')}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "presence validation" do

    it "checks email" do
      user = User.create(name: 'Mert Gunduz', password: '123456')
      expect(user.valid?).to be false
    end

    it "checks name" do
      user = User.create(email: 'test@test.com', password: '123456')
      expect(user.valid?).to be false
    end

    it "checks password" do
      user = User.create(email: 'test@test.com', name: 'Mert Gunduz')
      expect(user.valid?).to be false
    end
  end

end
