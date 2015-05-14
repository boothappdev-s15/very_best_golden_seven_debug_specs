require 'rails_helper'

RSpec.describe NeighborhoodsController, type: :controller do
  fixtures :neighborhoods

  let(:neighborhood) { neighborhoods(:one) }

  describe "GET #index" do
    it "responds successfully", points: 5 do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "responds successfully", points: 5 do
      get :show, id: neighborhood.id
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
    it "creates new neighborhood", points: 5 do
      expect {
        get :create_row, { name: "Logan Square", city: "Chicago" }
      }.to change(Neighborhood, :count).by(1)
    end
  end

  describe "GET #edit_form" do
    it "responds successfully", points: 5 do
      get :edit_form, id: neighborhood.id
      expect(response).to be_success
    end
  end

  describe "GET #update_row" do
    it "updates neighborhood", points: 5 do
      expect(neighborhood.name).not_to eq 'Logan Square'
      get :update_row, { id: neighborhood.id, name: "Logan Square", city: "Chicago" }
      expect(neighborhood.reload.name).to eq 'Logan Square'
    end
  end

  describe "GET #destroy" do
    it "destroys neighborhood", points: 5 do
      expect {
        get :destroy, id: neighborhood.id
      }.to change(Neighborhood, :count).by(-1)
    end
  end
end
