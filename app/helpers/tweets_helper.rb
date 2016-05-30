module TweetsHelper
  def user_name(tweet)
    link_to(
      tweet['user']['name'],
      "https://twitter.com/#{url_user_name(tweet)}",
      target: "_blank"
    )
  end

  def followers(tweet)
    tweet['user']['followers'] 
  end

  def retweet_count(tweet)
    tweet['retweet_count']
  end

  def favourites_count(tweet)
    tweet['user']['favourites_count']
  end

  def message(tweet)
    tweet['message']
  end

  def posted_date(tweet)
    link_to(
      tweet['date'].to_datetime.strftime("%d-%m-%Y às %H:%M"),
      "https://twitter.com/#{url_user_name(tweet)}/status/#{tweet['id']}",
      target: "_blank"
    )
  end

  private
  def url_user_name(tweet)
    tweet['user']['screen_name'].gsub('_', '')
  end
end
