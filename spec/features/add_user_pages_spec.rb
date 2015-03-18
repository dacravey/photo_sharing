require 'rails_helper'

describe "the add a user process" do
  it "adds a new user account" do
    visit '/users/new'
    fill_in 'Email', :with => 'jill@jill.com'
    fill_in 'Password', :with => 'jill'
    fill_in 'user_password_confirmation', :with => 'jill'
    click_on 'Sign Up'
    expect(page).to have_content '87 days'
    end

    it "gives error if any field left empty" do
      visit 'users/new'
      fill_in 'Email', :with => ''
      fill_in 'Password', :with => ''
      fill_in 'user_password_confirmation', :with => ''
      click_on 'Sign Up'
      expect(page).to have_content 'Please try again'
    end

    it "gives error if user already exists" do
      visit '/users/new'
      fill_in 'Email', :with => 'jill@jill.com'
      fill_in 'Password', :with => 'jill'
      fill_in 'user_password_confirmation', :with => 'jill'
      click_on 'Sign Up'
      visit '/users/new'
      fill_in 'Email', :with => 'jill@jill.com'
      fill_in 'Password', :with => 'jill'
      fill_in 'user_password_confirmation', :with => 'jill'
      click_on 'Sign Up'
      expect(page).to have_content 'Please try again'
    end

    it "logs you in if provided correct information" do
      visit '/users/new'
      fill_in 'Email', :with => 'jill@jill.com'
      fill_in 'Password', :with => 'jill'
      fill_in 'user_password_confirmation', :with => 'jill'
      click_on 'Sign Up'
      visit '/log-in'
      fill_in 'Email', :with => 'jill@jill.com'
      fill_in 'Password', :with => 'jill'
      click_on 'Log in'
      expect(page).to have_content 'Welcome'
    end
  end
