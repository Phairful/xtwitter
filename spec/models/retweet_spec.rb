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
    #it {should validate_uniqueness_of(:user).scoped_to(:tweet)}
  end
end
