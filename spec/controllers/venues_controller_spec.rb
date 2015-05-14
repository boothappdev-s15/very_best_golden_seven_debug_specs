require 'rails_helper'

RSpec.describe VenuesController, type: :controller do
  fixtures :venues

  let(:venue) { venues(:one) }

  describe "GET #index" do
    it "responds successfully", points: 5 do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "responds successfully", points: 5 do
      get :show, id: venue.id
      expect(response).to be_success
    end
  end

  describe "GET #new_form" do
    it "responds successfully", points: 5 do
      get :new_form
      expect(response).to be_success
    end
  end

  describe "GET #create_row" do
    it "creates new venue", points: 5 do
      expect {
        get :create_row, { name: "Lockdown Bar & Grill", address: "1024 N Western Ave, Chicago, IL 60622" }
      }.to change(Venue, :count).by(1)
    end
  end

  describe "GET #edit_form" do
    it "responds successfully", points: 5 do
      get :edit_form, id: venue.id
      expect(response).to be_success
    end
  end

  describe "GET #update_row" do
    it "updates venue", points: 5 do
      expect(venue.name).not_to eq 'Lockdown Bar & Grill'
      get :update_row, { id: venue.id, name: "Lockdown Bar & Grill", address: "1024 N Western Ave, Chicago, IL 60622" }
      expect(venue.reload.name).to eq 'Lockdown Bar & Grill'
    end
  end

  describe "GET #destroy" do
    it "destroys venue", points: 5 do
      expect {
        get :destroy, id: venue.id
      }.to change(Venue, :count).by(-1)
    end
  end
end
