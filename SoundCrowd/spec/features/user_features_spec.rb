require 'spec_helper'

describe "User can visit homepage" do
  context "and a sign up button" do
    it "can be seen" do
      visit root_path
      find_link('Register')
    end
    it "will be redirect them to sign up page" do
      visit root_path
      find_link('Register').click
      expect(current_path).to eq(new_user_path)
    end
  end
end

describe "User can visit signin page" do
  context "and a signin form" do
    let(:user){ create :user }
    let!(:previous_user){ User.create(email: "example@gmail.com", password:"secret" ) }
    it "can be seen" do
      visit new_user_path
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    it "can be filled out and submitted" do
      visit new_user_path
      fill_in "Email", :with => "test@email.com"
      fill_in "Password", :with => "password"
    end

    it "will create a user with valid info" do
      expect{
        visit new_user_path
        fill_in "Email", :with => user.email
        fill_in "Password", :with => user.password
        find_button('Create Account').click
        }.to change{ User.count}.by(1)
    end

    it "will not create a user with invalid info" do
      expect{
        visit new_user_path
        fill_in "Email", :with => previous_user.email
        fill_in "Password", :with => previous_user.password
        find_button('Create Account').click
        }.to_not change{ User.count }
    end

    it "can be submitted and redirected to their page" do

    end

  end
end

