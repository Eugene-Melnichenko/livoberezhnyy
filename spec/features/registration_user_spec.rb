require 'rails_helper'

RSpec.feature "Registration new user", type: :feature do
  describe "Valid registration user" do
    before { @company = create(:company) }
    it "New user" do
      visit new_user_registration_path
      expect(page).to have_text("Зареєструватися на сайті")
      fill_in 'user_email',                 with: "email@gmail.com"
      fill_in 'user_password',              with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Зареєструватися'
      expect(page).to have_text("Протягом декількох хвилин ви отримаєте лист з інструкціями з підтвердження вашого облікового запису.") 
    end
  end

  describe "Invalid registration user" do
    it "Invalid last_name" do
      visit new_user_registration_path
      fill_in 'user_last_name', with: "a" * 21
      click_button 'Зареєструватися'
      expect(page).to have_text("Last name - це поле занадто довге (максимум 20 символів)")
    end
  end

end
