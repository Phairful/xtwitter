require 'rails_helper'

RSpec.describe Follow, type: :model do
  context "associations" do
    it { should belong_to (:follower_user) }
    it { should belong_to (:followee_user) }
  end

  #---------------------------------------------------------------------------------------------------------
  context "validations" do
    #it {should validate_uniqueness_of(:user).scoped_to(:tweet)}
  end
end
