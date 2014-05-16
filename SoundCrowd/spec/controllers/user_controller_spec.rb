require 'spec_helper'

describe UsersController do

  context "#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end

  context "#show" do
    let(:user) {create :user}
    it "is successful" do
      get :show, :id => user.id
      expect(response).to be_success
    end
  end

  context "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    let(:user){ create :user }
    let!(:previous_user){ User.create(email: "example@gmail.com", password:"secret" ) }
    it "will create a user with valid info" do
      expect{
        post :create, :user => {email: user.email, password: user.password }
        expect(response).to be_success
        }.to change{ User.count}.by(1)
    end

    it "will not create a user with invalid info" do
      expect{
        post :create, :user => {email: previous_user.email, password: previous_user.password}
        expect(response).to be_success
        }.to_not change{ User.count }
    end
  end


end
