require 'rails_helper'
require 'spec_helper'

RSpec.describe Device, type: :model do
  describe ".validates" do
    let(:device) {build(:device)}
    it "has a mac address" do
      expect(build(:device, mac_address: nil)).to_not be_valid
    end

    it "has a unique mac address" do
      Device.create(mac_address: "a")
      expect(Device.new(mac_address: "a")).to_not be_valid
    end
  end
end
