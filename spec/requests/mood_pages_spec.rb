require 'spec_helper'

describe "MoodPages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:another) { FactoryGirl.create(:user) }

  let!(:older_mood) { FactoryGirl.create(:mood, user: user, created_at: 1.day.ago) }
  let!(:newer_mood) { FactoryGirl.create(:mood, user: user, created_at: 1.minute.ago) }

  before do
    user.confirm!
    sign_in user
  end

  describe "when saving mood" do
    before { visit root_path }

    describe "with valid information" do
      before { select '7', from: 'mood_state' }

      it "should save mood" do
        expect { click_button "Save" }.to change{ Mood.count }.by(1)
      end
    end

    describe "with invalid information" do
    end
  end

  describe "mood destruction" do
    describe "as correct user" do
      before { visit user_path(user) }
      describe "when mood is old" do
        it { should_not have_xpath("//div[@id = 'mood#{older_mood.id}']/a[@href = '/moods/#{older_mood.timestamp}']")}
      end

      describe "when mood is new" do
        it { should have_xpath("//div[@id = 'mood#{newer_mood.id}']/a[@href = '/moods/#{newer_mood.timestamp}']")}

        it "should delete a mood" do
          expect { click_link "delete" }.to change{ Mood.count }.by(-1)
        end
      end
    end

    describe "as incorrect user" do
      before do
        FactoryGirl.create(:mood, user: another)
        visit user_path(another)
      end

      it { should_not have_link('delete') }
    end
  end
end
