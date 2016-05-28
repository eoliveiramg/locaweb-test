class TweetSerializer
  include ActiveModel::Serialization

  attr_reader :tweets

  def initialize(tweets)
    @tweets = parsed_tweets(tweets)
  end

  private

  def parsed_tweets(tweets)
    return [] unless tweets.any?

    tweets.map do |tweet|
      {
        id: tweet['id_str'],  
        favorited: tweet['favorited'],
        retweet_count: tweet['retweet_count'],
        in_reply_to: tweet['in_reply_to_status_id_str'],
        date: tweet['created_at'],
        message: tweet['text'],
        user_mentions: tweet['entities']['user_mentions'],
        user: {
          id: tweet['user']['id_str'],
          name: tweet['user']['name'],
          screen_name: tweet['user']['screen_name'],
          followers: tweet['user']['followers_count'],
          favourites_count: tweet['user']['favourites_count']
        }
      }
    end
  end
end
