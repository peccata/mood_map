require 'spec_helper'

describe "User pages" do

 subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      sign_in user
      visit users_path
    end

    it { should have_title('All users') }
    it { should have_content('All users') }
  end

  describe "Profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) { FactoryGirl.create(:mood, user: user, state: 3) }
    let!(:m2) { FactoryGirl.create(:mood, user: user, state: 7) }

    before(:each) do
      sign_in user
      visit user_path(user)
    end

    it { should have_title(user.nickname) }
    it { should have_content(user.nickname) }
    it { should have_content(user.name) }

    describe "moods" do
      it { should have_content(m1.state) }
      it { should have_content(m2.state) }
      it { should have_content(user.moods.count) }
    end
  end

  describe "signup page" do
    before { visit new_user_registration_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

end
