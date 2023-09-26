require 'rails_helper'

RSpec.describe Like, type: :model do
  context "associations" do
    it { should belong_to (:tweet) }
    it { should belong_to (:user) }
  end

  #---------------------------------------------------------------------------------------------------------
  context "validations" do
    it {should validate_uniqueness_of(:user).scoped_to(:tweet)}
  end
end
