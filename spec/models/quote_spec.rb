require 'rails_helper'

RSpec.describe Quote, type: :model do
  context "associations" do
    it { should belong_to (:tweet) }
    it { should belong_to (:user) }
  end

  #---------------------------------------------------------------------------------------------------------
  context "validations" do
    it { should validate_presence_of(:quote_body) }
    it { should validate_length_of(:quote_body).is_at_least(1).is_at_most(255)}
  end
end
