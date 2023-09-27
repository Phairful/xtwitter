require 'rails_helper'


RSpec.describe Tweet, type: :model do
  
# ASSOCIATIONS SPECS

  context "associations" do
    #it { should belong_to(:original_tweet).with_foreign_key("reply_at_tweet_id") }
    it { should belong_to(:user) }
    #it { should belong_to(:reply_at_tweet) }
    it { should have_many(:likes) }
    it { should have_many(:bookmarks) }
    it { should have_many(:quotes) }
    it { should have_many(:retweets) }
    #it { should have_many(:taggings).with_foreign_key("tweet_id") }
  end

#----------------------------------------------------------------------------------------------------------
# VALIDATIONS SPECS
  context "validations" do
    it { should validate_presence_of(:tweet_body).with_message("must be given please") }
    it { should validate_length_of(:tweet_body).is_at_least(1).is_at_most(255) }
  end

#----------------------------------------------------------------------------------------------------------
# SCOPE SPECS





end