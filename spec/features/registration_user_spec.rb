require 'rails_helper'

RSpec.feature "Registration new user", type: :feature do
  describe "Valid registration user" do
    it "New user" do
      visit new_user_registration_path
      expect(page).to have_text("Sign up in account")
      fill_in 'user_email',                 with: "email@gmail.com"
      fill_in 'user_password',              with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Register'
      expect(page).to have_text("A message with a confirmation link has been sent to your email address.") 
      expect(page).to have_text("Please follow the link to activate your account.")
    end
  end

  describe "Invalid registration user" do
    it "Invalid first_name" do
      visit new_user_registration_path
      fill_in 'user_first_name', with: "a" * 21
      click_button 'Register'
      expect(page).to have_text("First name is too long (maximum is 20 characters)")
    end

    it "Invalid last_name" do
      visit new_user_registration_path
      fill_in 'user_last_name', with: "a" * 21
      click_button 'Register'
      expect(page).to have_text("Last name is too long (maximum is 20 characters)")
    end
  end

end
