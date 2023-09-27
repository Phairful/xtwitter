require 'rails_helper'
require 'faker'
RSpec.describe User, type: :model do
  
  context "associations" do
    it { should have_many(:follower_user)}
    it { should have_many(:followee_user)}
    it { should have_many(:tweets) }
    it { should have_many(:likes) }
    it { should have_many(:bookmarks) }
    it { should have_many(:quotes) }
    it { should have_many(:retweets) }
  end

#----------------------------------------------------------------------------------------------------------
it 'return user' do
  user = create(:user)
end


  context "validations" do
    #let(Faker::user) { create(:user) }

    #subject { user }
    it { should validate_presence_of(:username).with_message("must be given a username") }
    it { should validate_length_of(:username).is_at_most(20).with_message("is too long (maximum is 20 characters)") }
    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:email).with_message("must be given an email") }
    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(12).is_at_most(30).with_message("is too long (maximum is 30 characters)") }

    it { should validate_length_of(:display_name).is_at_most(20).with_message("is too long (maximum is 20 characters)") }
  end
end
