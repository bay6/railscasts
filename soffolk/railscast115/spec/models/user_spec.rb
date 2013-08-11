require 'spec_helper'

describe User do

  context "#find_or_create_from_auth_hash" do
    let(:auth_hash){ double('auth_hash') }
    before do
      auth_hash.stub(:uid => 1000)
      auth_hash.stub_chain(:info, :email => 'mock@preunion.com')
      auth_hash.stub_chain(:info, :urls, :GitHub => 'https://github.com/mock')
      auth_hash.stub_chain(:info, :nickname => 'mock')
    end

    subject{ User.find_or_create_from_auth_hash auth_hash }

    it "should create new user if not exist" do
      expect(subject).to be_a_kind_of User
    end

    it "should return the user when exist user with the provide uid and provider" do
      exist_user = create(:user, uid: 1000)
      expect(subject).to eq exist_user
    end

  end
  
end

