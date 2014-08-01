require "rails_helper"

feature "Create a new shout" do
  background do
    user = create(:user)
    sign_in(user)
  end

  scenario "create a text shout" do
    text_shout = build(:text_shout)

    visit root_path
    within "#new_text_shout" do
      fill_in "text_shout_body", with: text_shout.body
      click_button "Shout!"
    end

    expect(page).to have_content text_shout.body
  end
end
