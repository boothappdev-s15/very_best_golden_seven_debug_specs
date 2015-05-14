require 'rails_helper'

RSpec.describe 'Dishes feature', type: :feature do
  fixtures :dishes

  let(:dish) { dishes(:one) }

  describe "GET /dishes" do
    it "displays dishes", points: 5 do
      visit "/dishes"

      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.cuisine)
    end
  end

  describe "GET /dishes/:id" do
    it "displays dish", points: 5 do
      visit "/dishes"
      find(:xpath, "//a[@href='/dishes/#{dish.id}']").click

      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.cuisine)
    end
  end

  describe "GET /dishes/new_form" do
    it "displays new dish form", points: 5 do
      visit "/dishes/new_form"

      expect(page).to have_selector('input#name')
      expect(page).to have_selector('input#cuisine')
    end
  end

  describe "GET /create_dish" do
    it "creates new dish", points: 5 do
      visit "/dishes/new_form"
      fill_in 'Name', with: 'Falafel'
      fill_in 'Cuisine', with: 'Middle Eastern'
      click_button 'Create Dish'

      expect(page).to have_content('Falafel')
      expect(page).to have_content('Middle Eastern')
    end
  end

  describe "GET /dishes/:id/edit_form" do
    it "displays edit dish form", points: 5 do
      visit "/dishes"
      find(:xpath, "//a[@href='/dishes/#{dish.id}/edit_form']").click

      expect(page).to have_selector("input#name[value='#{dish.name}']")
      expect(page).to have_selector("input#cuisine[value='#{dish.cuisine}']")
    end
  end

  describe "GET /update_dish/:id" do
    it "updates dish", points: 5 do
      visit "/dishes/"
      find(:xpath, "//a[@href='/dishes/#{dish.id}/edit_form']").click
      fill_in 'Name', with: 'Falafel'
      fill_in 'Cuisine', with: 'Middle Eastern'
      click_button 'Update Dish'

      expect(page).not_to have_content(dish.name)
      expect(page).not_to have_content(dish.cuisine)
      expect(page).to have_content('Falafel')
      expect(page).to have_content('Middle Eastern')
    end
  end

  describe "GET /delete_dish/:id/" do
    it "deletes dish", points: 5 do
      visit "/dishes/"
      find(:xpath, "//a[@href='/delete_dish/#{dish.id}']").click

      expect(page).not_to have_content(dish.name)
      expect(page).not_to have_content(dish.cuisine)
    end
  end
end
