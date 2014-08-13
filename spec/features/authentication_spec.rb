require "rails_helper"

feature "Signing up" do
  scenario "a new user" do
    user = build(:user)

    visit root_path
    within "#new_user" do
      fill_in "Username", with: user.username
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password_digest
    end
    click_button "Sign up"

    expect(page).to have_content "Timeline"
  end
end

feature "Signing in" do
  before(:each) do
    @user = create(:user)
  end

  scenario "with correct credentials" do
    visit root_path
    sign_in_as(@user.username, @user.password_digest)

    expect(page).to have_content "Timeline"
  end

  scenario "with incorrect credentials" do
    visit root_path
    sign_in_as(@user.username, "incorrect_password")

    expect(page).to have_selector "#session"
  end

  def sign_in_as(username, password)
    within "#session" do
      fill_in "Username", with: username
      fill_in "Password", with: password
    end

    click_button "Sign in"
  end
end
