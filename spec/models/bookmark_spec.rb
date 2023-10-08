require 'rails_helper'

RSpec.describe Bookmark, type: :model do

# ASSOCIATIONS SPECS

  context "associations" do
    it { should belong_to(:tweet) }
    it { should belong_to(:user) }
  end

  #---------------------------------------------------------------------------------------------------------
  context "validations" do

    it "should validate scoped uniqueness" do
    user1 = create(:user)
    user2 = create(:user)
    tweet = create(:tweet, user: user1)
    bookmarking1 = tweet.bookmarking(user2.id)
    bookmarking2 = tweet.bookmarking(user2.id)
    
    expect(bookmarking1.valid?).to be true
    expect(bookmarking2.valid?).to be false
    expect(bookmarking2.errors.messages[:user].first).to eq "Has already been bookmarked"
  end
end
end
