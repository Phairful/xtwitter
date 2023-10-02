require 'rails_helper'

RSpec.describe "tweets/edit", type: :view do
  let(:tweet) {
    Tweet.create!(
      tweet_body: "MyString",
      user_id: "MyString",
      reply_at_tweet_id: "MyString"
    )
  }

  before(:each) do
    assign(:tweet, tweet)
  end

  it "renders the edit tweet form" do
    render

    assert_select "form[action=?][method=?]", tweet_path(tweet), "post" do

      assert_select "input[name=?]", "tweet[tweet_body]"

      assert_select "input[name=?]", "tweet[user_id]"

      assert_select "input[name=?]", "tweet[reply_at_tweet_id]"
    end
  end
end
