require 'rails_helper'

RSpec.describe 'Venue feature', type: :feature do
  fixtures :venues

  let(:venue) { venues(:one) }

  describe "GET /venues" do
    it "displays venues", points: 5 do
      visit "/venues"

      expect(page).to have_content(venue.name)
      expect(page).to have_content(venue.address)
    end
  end

  describe "GET /venues/:id" do
    it "displays venue", points: 5 do
      visit "/venues"
      find(:xpath, "//a[@href='/venues/#{venue.id}']").click

      expect(page).to have_content(venue.name)
      expect(page).to have_content(venue.address)
    end

    it "displays latitude and longitude", points: 5 do
      visit "/venues"
      find(:xpath, "//a[@href='/venues/#{venue.id}']").click

      expect(page).to have_content('38.89')
      expect(page).to have_content('-77.03')
    end

    it "displays a google map", points: 5 do
      pending 'EXTRA CREDIT: capybara-webkit is needed'
      visit "/venues"
      find(:xpath, "//a[@href='/venues/#{venue.id}']").click

      expect(page).to have_selector("div#map-canvas a[href='https://www.google.com/maps/@38.8976757,-77.03652799999999,15z/data=!10m1!1e1!12b1?source=apiv3&rapsrc=apiv3']")
    end
  end

  describe "GET /venues/new_form" do
    it "displays new venue form", points: 5 do
      visit "/venues/new_form"

      expect(page).to have_selector('input#name')
      expect(page).to have_selector('input#address')
    end
  end

  describe "GET /create_venue" do
    it "creates new venue", points: 5 do
      visit "/venues/new_form"
      fill_in 'Name', with: 'Goose Island'
      fill_in 'Address', with: '1800 North Clybourn Avenue, Chicago, IL 60614'
      click_button 'Create Venue'

      expect(page).to have_content('Goose Island')
      expect(page).to have_content('1800 North Clybourn Avenue, Chicago, IL 60614')
    end
  end

  describe "GET /venues/:id/edit_form" do
    it "displays edit venue form", points: 5 do
      visit "/venues"
      find(:xpath, "//a[@href='/venues/#{venue.id}/edit_form']").click

      expect(page).to have_selector("input#name[value='#{venue.name}']")
      expect(page).to have_selector("input#address[value='#{venue.address}']")
    end
  end

  describe "GET /update_venue/:id" do
    it "updates venue", points: 5 do
      visit "/venues/"
      find(:xpath, "//a[@href='/venues/#{venue.id}/edit_form']").click
      fill_in 'Name', with: 'Goose Island'
      fill_in 'Address', with: '1800 North Clybourn Avenue, Chicago, IL 60614'
      click_button 'Update Venue'

      expect(page).not_to have_content(venue.name)
      expect(page).not_to have_content(venue.address)
      expect(page).to have_content('Goose Island')
      expect(page).to have_content('1800 North Clybourn Avenue, Chicago, IL 60614')
    end
  end

  describe "GET /delete_venue/:id/" do
    it "deletes venue", points: 5 do
      visit "/venues/"
      find(:xpath, "//a[@href='/delete_venue/#{venue.id}']").click

      expect(page).not_to have_content(venue.name)
      expect(page).not_to have_content(venue.address)
    end
  end
end
