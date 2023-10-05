require 'rails_helper'

RSpec.describe Like, type: :model do
# ASSOCIATIONS SPECS

  context "associations" do
    it { should belong_to (:tweet) }
    it { should belong_to (:user) }
  end

#---------------------------------------------------------------------------------------------------------
  context "validations" do
    it "should validate scoped uniqueness" do
      user1 = create(:user)
      user2 = create(:user)
      tweet = create(:tweet, user: user1)
      like1 = tweet.liking(user2.id)
      like2 = tweet.liking(user2.id)
      
      expect(like1.valid?).to be true
      expect(like2.valid?).to be false
      expect(like2.errors.messages[:user_id].first).to eq "Has already been liked"
    end
  end
end
