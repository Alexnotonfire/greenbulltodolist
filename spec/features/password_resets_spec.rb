require "spec_helper"

describe 'PasswordResetsMailer' do
  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)
    visit login_path
    click_link "Forgot your password?"
    fill_in "Email", with: user.email
    click_button "Reset Password"
    expect(page).to have_content "Email sent with password reset instructions"
  end

  it "emails no user when email does not exist" do
    visit login_path
    click_link "Forgot your password?"
    fill_in "Email", with: "randomtext"
    click_button "Reset Password"
    expect(page).to have_content "The user does not exist"
  end

end

