require 'rails_helper'

RSpec.describe Like, type: :model do
# ASSOCIATIONS SPECS

  context "associations" do
    it { should belong_to (:tweet) }
    it { should belong_to (:user) }
  end

  #---------------------------------------------------------------------------------------------------------
  context "validations" do

    #the validate uniqeness within an scope seems to be a validation that cant't be tested
    #per what the shoulda-matcher documentation says it isn't supported yet.
    #
    # https://github.com/thoughtbot/shoulda-matchers/issues/814
    #it {should validate_uniqueness_of(:user).scoped_to(:tweet)}
  end
end
