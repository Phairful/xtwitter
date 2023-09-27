require 'rails_helper'

RSpec.describe Quote, type: :model do

# ASSOCIATIONS SPECS

  context "associations" do
    it { should belong_to (:tweet) }
    it { should belong_to (:user) }
  end

#---------------------------------------------------------------------------------------------------------
# VALIDATION SPEC
  context "validations" do
    #quote body validations
    it { should validate_presence_of(:quote_body).with_message("must be given please") }
    it { should validate_length_of(:quote_body).is_at_least(1).is_at_most(255)}
  end
end
