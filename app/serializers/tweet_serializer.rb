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
        date: tweet['created_at'],
        message: tweet['text'],
        user: {
          id: tweet['user']['id_str'],
          name: tweet['user']['name'], 
          followers: tweet['user']['followers_count']
        }
      }
    end
  end
end
