require 'rails_helper'

RSpec.describe Bookmark, type: :model do

# ASSOCIATIONS SPECS

  context "associations" do
    it { should belong_to(:tweet) }
    it { should belong_to(:user) }
  end

  #---------------------------------------------------------------------------------------------------------
  context "validations" do
    subject!(:bookmark) { FactoryBot.build(:bookmark) }

    #the validate uniqeness within an scope seems to be a validation that cant't be tested
    #per what the shoulda-matcher documentation says it isn't supported yet.
    #
    # https://github.com/thoughtbot/shoulda-matchers/issues/814
    #
    #i offer a workaround

    #it {should validate_uniqueness_of(:user).case_insensitive}
  end
end
