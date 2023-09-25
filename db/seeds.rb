# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Follow.create(follower_user_id:2, followee_user_id:1)

#users
User.create(username: "pepitos", display_name:"yanix", email: "yanira@gmail.com" ,password: "abcDEF123456789!" ,bio:"" ,location:"")
User.create(username: "yanura", display_name:"asdae", email: "pepon@gmail.com" ,password: "abcDEF123456789!" ,bio:"" ,location:"")
User.create(username: "jaimin", display_name:"carterox", email: "jaime@gmail.com" ,password: "abcDEF123456789!" ,bio:"" ,location:"")
User.create(username: "anixx", display_name:"anousx", email: "ana@gmail.com" ,password: "abcDEF123456789!" ,bio:"" ,location:"")
User.create(username: "sofofo", display_name:"ysofx", email: "sofia@gmail.com" ,password: "abcDEF123456789!" ,bio:"" ,location:"")


#tweets
Tweet.create(tweet_body: "pepitos1", tweeting_user_id: 1, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos2", tweeting_user_id: 1, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos3", tweeting_user_id: 1, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos32", tweeting_user_id: 1, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos4", tweeting_user_id: 1, reply_at_tweet_id: nil)

Tweet.create(tweet_body: "pepitos1", tweeting_user_id: 2, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos2", tweeting_user_id: 2, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos3", tweeting_user_id: 2, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos5", tweeting_user_id: 2, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos4", tweeting_user_id: 2, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos1", tweeting_user_id: 2, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos2", tweeting_user_id: 2, reply_at_tweet_id: nil)

Tweet.create(tweet_body: "pepitos1", tweeting_user_id: 3, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos2", tweeting_user_id: 3, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos3", tweeting_user_id: 3, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos5", tweeting_user_id: 3, reply_at_tweet_id: nil)
Tweet.create(tweet_body: "pepitos4", tweeting_user_id: 3, reply_at_tweet_id: nil)

Tweet.create(tweet_body: "prueba #htaaafg", tweeting_user_id: 3, reply_at_tweet_id: nil)

#replies

Tweet.create(tweet_body: "pepitos1", tweeting_user_id: 1, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos2", tweeting_user_id: 1, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos3", tweeting_user_id: 1, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos32", tweeting_user_id: 1, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos4", tweeting_user_id: 1, reply_at_tweet_id: 2)

Tweet.create(tweet_body: "pepitos1", tweeting_user_id: 2, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos2", tweeting_user_id: 2, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos3", tweeting_user_id: 2, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos5", tweeting_user_id: 2, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos4", tweeting_user_id: 2, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos1", tweeting_user_id: 2, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos2", tweeting_user_id: 2, reply_at_tweet_id: 2)

Tweet.create(tweet_body: "pepitos1", tweeting_user_id: 3, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos2", tweeting_user_id: 3, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos3", tweeting_user_id: 3, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos5", tweeting_user_id: 3, reply_at_tweet_id: 2)
Tweet.create(tweet_body: "pepitos4", tweeting_user_id: 3, reply_at_tweet_id: 2)