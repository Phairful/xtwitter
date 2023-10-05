require 'rails_helper'

RSpec.describe Retweet, type: :model do

# ASSOCIATIONS SPECS
  context "associations" do
    it { should belong_to (:tweet) }
    it { should belong_to (:user) }
  end

  #---------------------------------------------------------------------------------------------------------
# VALIDATION SPEC
  context "validations" do
    it "should validate scoped uniqueness" do
      user1 = create(:user)
      tweet = create(:tweet, user: user1)
      rt1 = tweet.retweeting(user1.id)
      rt2 = tweet.retweeting(user1.id)
    
      expect(rt1.valid?).to be true
      expect(rt2.valid?).to be false
      expect(rt2.errors.messages[:user_id].first).to eq "Has already been retweed"
    end
  end
end
