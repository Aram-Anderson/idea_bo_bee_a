require 'rails_helper'

describe User do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a username" do
        user = User.new(email: Faker::Internet.email, password: Faker::Internet.password)
        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(username: Faker::Internet.user_name, password: Faker::Internet.password)
        expect(user).to be_invalid
      end

      it "is invalid without an password" do
        user = User.new(username: Faker::Internet.user_name, email: Faker::Internet.email)
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is invalid without an email" do
        user = User.new(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password)
        expect(user).to be_valid
      end
    end

    context "admin user" do
      it "can be an admin user" do
        user = User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password, role: 1)
        user2 = User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password, role: 2)

        expect(user.admin?).to be_truthy
        expect(user2.godzilla_admin?).to be_truthy
      end
    end
  end
end
