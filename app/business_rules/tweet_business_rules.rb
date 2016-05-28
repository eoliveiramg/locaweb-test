class TweetBusinessRules
  def initialize(tweets)
    @tweets = tweets.as_json
  end

  def sort;end

  def filter(search_term, search_replay = true)
    by_term(search_term)
    replay_exclude(search_replay)
  end

  private
  def by_term(term)
    @tweets.select! do |tweet|
      tweet['message'].include? term
    end
  end

  def replay_exclude(param)
    if param == true
      @tweets.select! { |tweet| tweet['in_reply_to'].empty? }
    end

    @tweets
  end
end
