require 'rails_helper'
require 'spec_helper'

RSpec.describe Device, type: :model do
  describe ".validates" do
    let(:device) {build(:device)}
    it "has a unique mac address" do
      Device.create(mac_address: "123ab")
      expect(Device.new(mac_address:"123ab")).to_not be_valid
    end
  end
end
