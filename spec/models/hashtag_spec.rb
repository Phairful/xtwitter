require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  #test the association table with table taggings 
  context "associations" do
    it { should have_many(:hashtag_id) }
  end
#---------------------------------------------------------------------------------------------------------- 
#tests the validation of the body of the hashtag, it should be beetween
  context "validations" do
    it { should validate_presence_of(:hashtag_body) }
    it { should validate_length_of(:hashtag_body).is_at_most(255) }
    it { should validate_uniqueness_of(:hashtag_body)}
  end 
end
