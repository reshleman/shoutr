require "rails_helper"

feature "Search for a shout" do
  scenario "search for a text shout by its body" do
    user = create(:user)
    sign_in(user)
    text_shout = build(:text_shout)
    user.shouts.create(content: text_shout)

    visit root_path
    within "#search-form" do
      fill_in "Query", with: text_shout.body.split(" ").first
      click_button "Search"
    end

    expect(page).to have_content text_shout.body
  end
end
