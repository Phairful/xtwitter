require 'rails_helper'

RSpec.describe "tweets/show", type: :view do
  before(:each) do
    assign(:tweet, Tweet.create!(
      tweet_body: "Tweet Body",
      user_id: "User",
      reply_at_tweet_id: "Reply At Tweet"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tweet Body/)
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Reply At Tweet/)
  end
end
