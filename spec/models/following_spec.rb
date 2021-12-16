require 'rails_helper'

RSpec.describe Following, type: :model do
  context "validates association" do
    before do
      @user = User.create!(email: 'test@followabletest.com', name: 'Followable Test', password: '123456')
      @genre = Genre.create!(name: 'Followable Test')
      @film = Film.create!(title: 'Followable Test', year: 2000, genre_id: @genre.id)
      @individual = Individual.create!(name: 'Followable Test')
    end

    it "checks association with user" do
      following = Following.create(user_id: @user.id)
      expect(following.user).to eq @user
    end

    it "checks association with film" do
      following = Following.create(user_id: @user.id, followable_type: 'Film', followable_id: @film.id)
      expect(following.followable).to eq @film
    end

    it "checks association with genre" do
      following = Following.create(user_id: @user.id, followable_type: 'Genre', followable_id: @genre.id)
      expect(following.followable).to eq @genre
    end

    it "checks association with individual" do
      following = Following.create(user_id: @user.id, followable_type: 'Individual', followable_id: @individual.id)
      expect(following.followable).to eq @individual
    end

    it "checks uniqueness with film" do
      following = Following.create(user_id: @user.id, followable_id: @film.id, followable_type: 'Film')
      following2 = Following.create(user_id: @user.id, followable_id: @film.id, followable_type: 'Film')
      expect(following2.valid?).to be false
    end

    it "checks uniqueness with genre" do
      following = Following.create(user_id: @user.id, followable_id: @genre.id, followable_type: 'Genre')
      following2 = Following.create(user_id: @user.id, followable_id: @genre.id, followable_type: 'Genre')
      expect(following2.valid?).to be false
    end

    it "checks uniqueness with individual" do
      following = Following.create(user_id: @user.id, followable_id: @individual.id, followable_type: 'Individual')
      following2 = Following.create(user_id: @user.id, followable_id: @individual.id, followable_type: 'Individual')
      expect(following2.valid?).to be false
    end

  end
end
