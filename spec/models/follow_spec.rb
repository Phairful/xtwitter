require 'rails_helper'
require 'faker'

RSpec.describe Follow, type: :model do

# ASSOCIATIONS SPECS

  context "associations" do
    it { should belong_to (:follower_user) }
    it { should belong_to (:followee_user) }
  end

  #---------------------------------------------------------------------------------------------------------
  context "validations" do

    it "should validate scoped uniqueness" do
      user1 = create(:user)
      user2 = create(:user)
      follow1 = user1.following(user2)
      p follow1
      print follow1
      puts follow1
      follow2 = user1.following(user2)
    
      expect(follow1.valid?).to be true
      print
      expect(follow2.valid?).to be false
      expect(follow2.errors.messages[:follower_user_id].first).to eq "Has already been followed"
    end
  end
end