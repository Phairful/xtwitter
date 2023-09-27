require 'rails_helper'
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
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_least(1).is_at_most(20) }
    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_least(1) } # Adjusted validation_length_of
    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(12).is_at_most(30) }

    it { should validate_length_of(:display_name).is_at_least(1).is_at_most(20) }
  end
end
