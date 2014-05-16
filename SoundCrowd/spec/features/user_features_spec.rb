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
  end
end


describe "User can view their own profile page" do
  let!(:user){ create :user }
  it "User's email can be seen" do
    visit user_path(user)
    expect(page).to have_content(user.email)
  end

  it "User's playlist can be seen" do
    visit user_path(user)
    expect(page).to have_content("Playlists")
  end

end
