require 'rails_helper'

RSpec.describe "tweets/new", type: :view do
  before(:each) do
    assign(:tweet, Tweet.new(
      tweet_body: "MyString",
      user_id: "MyString",
      reply_at_tweet_id: "MyString"
    ))
  end

  it "renders new tweet form" do
    render

    assert_select "form[action=?][method=?]", tweets_path, "post" do

      assert_select "input[name=?]", "tweet[tweet_body]"

      assert_select "input[name=?]", "tweet[user_id]"

      assert_select "input[name=?]", "tweet[reply_at_tweet_id]"
    end
  end
end
