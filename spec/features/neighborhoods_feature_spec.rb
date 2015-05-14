require 'rails_helper'

RSpec.describe 'Neighborhoods feature', type: :feature do
  fixtures :neighborhoods

  let(:neighborhood) { neighborhoods(:one) }

  describe "GET /neighborhoods" do
    it "displays neighborhoods", points: 5 do
      visit "/neighborhoods"

      expect(page).to have_content(neighborhood.name)
      expect(page).to have_content(neighborhood.city)
    end
  end

  describe "GET /neighborhoods/:id" do
    it "displays neighborhood", points: 5 do
      visit "/neighborhoods"
      find(:xpath, "//a[@href='/neighborhoods/#{neighborhood.id}']").click

      expect(page).to have_content(neighborhood.name)
      expect(page).to have_content(neighborhood.city)
    end
  end

  describe "GET /neighborhoods/new_form" do
    it "displays new neighborhood form", points: 5 do
      visit "/neighborhoods/new_form"

      expect(page).to have_selector('input#name')
      expect(page).to have_selector('input#city')
    end
  end

  describe "GET /create_neighborhood" do
    it "creates new neighborhood", points: 5 do
      visit "/neighborhoods/new_form"
      fill_in 'Name', with: 'Wrigleyville'
      fill_in 'City', with: 'Chicago'
      click_button 'Create Neighborhood'

      expect(page).to have_content('Wrigleyville')
      expect(page).to have_content('Chicago')
    end
  end

  describe "GET /neighborhoods/:id/edit_form" do
    it "displays edit neighborhood form", points: 5 do
      visit "/neighborhoods"
      find(:xpath, "//a[@href='/neighborhoods/#{neighborhood.id}/edit_form']").click

      expect(page).to have_selector("input#name[value='#{neighborhood.name}']")
      expect(page).to have_selector("input#city[value='#{neighborhood.city}']")
    end
  end

  describe "GET /update_neighborhood/:id" do
    it "updates neighborhood", points: 5 do
      visit "/neighborhoods/"
      find(:xpath, "//a[@href='/neighborhoods/#{neighborhood.id}/edit_form']").click
      fill_in 'Name', with: 'Wrigleyville'
      fill_in 'City', with: 'Chicago'
      click_button 'Update Neighborhood'

      expect(page).not_to have_content(neighborhood.name)
      expect(page).to have_content('Wrigleyville')
      expect(page).to have_content('Chicago')
    end
  end

  describe "GET /delete_neighborhood/:id/" do
    it "deletes neighborhood", points: 5 do
      visit "/neighborhoods/"
      find(:xpath, "//a[@href='/delete_neighborhood/#{neighborhood.id}']").click

      expect(page).not_to have_content(neighborhood.name)
    end
  end
end
