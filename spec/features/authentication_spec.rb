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
  scenario "with correct credentials" do
    user = create(:user)

    visit root_path
    within "#session" do
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password_digest
    end
    click_button "Sign in"

    expect(page).to have_content "Timeline"
  end

  scenario "with incorrect credentials" do
    user = create(:user)

    visit root_path
    within "#session" do
      fill_in "Username", with: user.username
      fill_in "Password", with: "incorrect_password"
    end
    click_button "Sign in"

    expect(page).to have_selector "#session"
  end
end
