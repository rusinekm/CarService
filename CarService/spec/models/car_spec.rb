require 'rails_helper'

RSpec.describe Car, :type => :model do
  let(:auto) {FactoryGirl.create(:car)}
  let(:client) {FactoryGirl.create(:user)}  
  let(:rental) {FactoryGirl.create(:rental)}
  context "mielage" do
    it "allows 31" do
      auto.mileage=31
      expect(auto).to be_valid
    end
  end

  context "can be rented" do
  
    it "can be rented" do
      expect(auto).not_to be_rented
    end
    it "cannot be rented" do
      expect(Car.find(rental.car_id)).to be_rented
    end
    it "is available only if rentals have expired" do
      rent= FactoryGirl.create(:rental, rented_to: (Date.today-1.day))
      expect(Car.find(rent.car_id)).to_not be_rented
    end

    # it'd stubbed doubles mocking
    it "is rented if there is a current rental" do
      expect(auto).to receive_message_chain(:rentals, :current, :first).and_return(rental)
      expect(auto).to be_rented
    end

    it "is available" do
      allow(auto).to receive(:rented?).and_return(false)
      expect(auto).not_to be_rented
    end
  end


end
