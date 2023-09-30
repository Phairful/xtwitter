require 'faker'
require 'rails_helper'

RSpec.describe Hashtag, type: :model do

# ASSOCIATIONS SPECS

  #test the association table with table taggings 
  context "associations" do
    it { should have_many(:taggings).with_foreign_key("hashtag_id") }
  end
#---------------------------------------------------------------------------------------------------------- 
# CREATION OF HASHTAGS FOR TESTING
it 'return user' do
  hashtag = create(:hashtag)
end
#----------------------------------------------------------------------------------------------------------
# VALIDATIONS SPECS
  #tests the validation of the body of the hashtag, it should be beetween
  context "validations" do
    it { should validate_presence_of(:hashtag_body).with_message( "must be given please" ) }
    it { should validate_length_of(:hashtag_body).is_at_most(255) }
    it { should validate_uniqueness_of(:hashtag_body)}
  end 
end
