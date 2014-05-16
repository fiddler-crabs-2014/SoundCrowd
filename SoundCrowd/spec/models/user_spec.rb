require 'spec_helper'

describe User do
  context "validatations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end
end
