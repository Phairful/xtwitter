require 'rails_helper'

RSpec.describe Tagging, type: :model do
  context "associations" do
    it { should belong_to (:hashtag) }
    it { should belong_to (:tweet) }
  end
end
