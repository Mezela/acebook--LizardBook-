RSpec.feature "Timeline", type: :feature do

  scenario "Can like post", js: true do
    signup_as_new_user_js("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    expect(page).to have_content("0 licks")
    click_link("👅")
    expect(page).to have_content("1 licks")
    expect(page).to have_content("LICKED BY: Pam-Lizard")
  end

end
