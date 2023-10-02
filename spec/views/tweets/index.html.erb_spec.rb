require 'rails_helper'

RSpec.describe "tweets/index", type: :view do
  before(:each) do
    assign(:tweets, [
      Tweet.create!(
        tweet_body: "Tweet Body",
        user_id: "User",
        reply_at_tweet_id: "Reply At Tweet"
      ),
      Tweet.create!(
        tweet_body: "Tweet Body",
        user_id: "User",
        reply_at_tweet_id: "Reply At Tweet"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Tweet Body".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("User".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Reply At Tweet".to_s), count: 2
  end
end
