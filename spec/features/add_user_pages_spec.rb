require 'rails_helper'

describe "the add a user process" do
  it "adds a new user account" do
    visit home_path
    click_on 'Create Account'
    fill_in 'Email' with :'joe@joe.com'
    fill_in 'Password' with :'badpassword'
    fill_in 'Password Confirmation' with :'badpassword'
    click_on 'Sign Up'
    expect(page).to have_content ''
    end
  end

end
