require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
  let(:device_params) do {
        device: {
            name: "Ada Lovelace",
            mac_address: "123ab",
            manual_watering_requested: false,
            last_auto_water_date: "2016-03-16",
            auto_water_period_days: 5,
            auto_water_hour_utc: 7
        }
    }
  end
let(:device) { create(:device) }
  describe "GET 'edit'" do
      it "is successful" do
        get :edit, mac_address: device.mac_address
        expect(response.status). to eq 200
      end
    end

  describe "POST 'create'" do
    let(:good_params) do
      {
        device: {
          name: "Ada Lovelace",
          mac_address: "123ab",
          manual_watering_requested: false,
          last_auto_water_date: "2016-03-16",
          auto_water_period_days: 5,
          auto_water_hour_utc: 7
        }
      }
    end

    let (:bad_params) do
      {
        device: {
          name: nil,
          mac_address: nil,
          manual_watering_requested: nil,
          last_auto_water_date: nil,
          auto_water_period_days: nil,
          auto_water_hour_utc: nil
        }
      }
    end

  describe "PATCH 'update'" do
    let(:update_params) do {

          name: "Charles Babbage",
          mac_address: "123",
          manual_watering_requested: true,
          last_auto_water_date: "2015-03-16",
          auto_water_period_days: 6,
          auto_water_hour_utc: 6

      }
    end

    it "redirects to show page" do
      patch :update,{ mac_address: device.mac_address }
      expect(subject).to redirect_to profile_path
      end
    end

    describe "GET 'should_water'" do
      it "renders No" do
        get :should_water, mac_address: device.mac_address
        expect(response.body).to eq "No"
      end
    end

    describe "GET 'water'" do
      it "is successful" do
        get :water, mac_address: device.mac_address
        expect(response.status). to eq 200
      end
    end

  describe "DELETE 'destroy'" do
    it "redirects to index page" do
      delete :destroy, { mac_address: device.mac_address }
      expect(subject).to redirect_to profile_path
      end
    end
  end
end
