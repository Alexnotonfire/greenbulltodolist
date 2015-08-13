require "spec_helper"

describe UserMailer do

  describe "signup_confirmation" do
    user = FactoryGirl.create(:user)
    let(:mail) { UserMailer.signup_confirmation(user) }

    it 'renders the subject' do
      expect(mail.subject).to eq("Sign Up Confirmation")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.first_name)
    end
  end

  describe "password_reset" do
    user = FactoryGirl.create(:user)
    let(:mail) { UserMailer.password_reset(user) }

    it 'renders the subject' do
      expect(mail.subject).to eq("Password Reset")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end
  end

end
