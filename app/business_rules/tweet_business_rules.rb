class TweetBusinessRules
  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets.as_json
  end

  def sort
    user_42_tweets = select_user_42_tweets
    other_users_tweets = select_other_users_tweets

    sort_user_42_tweets = sort_by_retweet_count_and_followers(user_42_tweets)
    sort_other_users_tweets = sort_by_retweet_count_and_followers(other_users_tweets)
  
    sort_user_42_tweets.concat(sort_other_users_tweets)
  end

  def filter(search_term, search_replay = true)
    by_term(search_term)
    replay_exclude(search_replay)
  end

  private
  def sort_by_retweet_count_and_followers(tweet_array)
    tweet_array.sort_by do |tweet|
      [tweet['retweet_count'], tweet['user']['followers_count']]
    end
  end

  def by_term(term)
    tweets.delete_if do |tweet|
      tweet['message'].exclude? term
    end
  end

  def replay_exclude(param)
    tweets.select! { |tweet| tweet['in_reply_to'].empty? } if param == true
    tweets
  end

  def select_user_42_tweets
    tweets.select { |tweet| tweet['user_mentions'] == 42 }
  end

  def select_other_users_tweets
    tweets.select { |tweet| tweet['user_mentions'] != 42 }
  end
end
