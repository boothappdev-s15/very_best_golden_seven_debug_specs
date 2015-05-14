require 'rails_helper'

RSpec.describe DishesController, type: :controller do
  fixtures :dishes

  let(:dish) { dishes(:one) }

  describe "GET #index" do
    it "responds successfully", points: 5 do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "responds successfully", points: 5 do
      get :show, id: dish.id
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
    it "creates new dish", points: 5 do
      expect {
        get :create_row, { name: "Burger", cuisine: "American" }
      }.to change(Dish, :count).by(1)
    end
  end

  describe "GET #edit_form" do
    it "responds successfully", points: 5 do
      get :edit_form, id: dish.id
      expect(response).to be_success
    end
  end

  describe "GET #update_row" do
    it "updates dish", points: 5 do
      expect(dish.name).not_to eq 'Burger'
      get :update_row, { id: dish.id, name: "Burger", cuisine: "American" }
      expect(dish.reload.name).to eq 'Burger'
    end
  end

  describe "GET #destroy" do
    it "destroys dish", points: 5 do
      expect {
        get :destroy, id: dish.id
      }.to change(Dish, :count).by(-1)
    end
  end
end
