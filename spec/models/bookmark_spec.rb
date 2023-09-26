require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  context "associations" do
    it { should belong_to (:tweet) }
    it { should belong_to (:user) }
  end

  #---------------------------------------------------------------------------------------------------------
  context "validations" do
    subject (:bookmark) { FactoryBot.build(:bookmark) }
    #subject { :user }
    it {should validate_uniqueness_of(:user).scoped_to(:tweet) }
  end
end
