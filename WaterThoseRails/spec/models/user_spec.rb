require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".validates" do
    let(:user) {build(:user)}
    it "has an email address" do
      expect(build(:user, email_address: nil)).to_not be_valid
    end

    it "has a unique email address" do
      User.create(email_address: "a@a.com")
      expect(User.new(email_address:"a@a.com")).to_not be_valid
    end
  end
end
