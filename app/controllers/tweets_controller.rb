class TweetsController < ApplicationController

  def index
    request = Api::Tweeter.new('http://tweeps.locaweb.com.br/', request_params)
    response = request.connect

    @tweets = apply_business_rules(parsed_tweets(response), filter_params)
  end

  private
  def request_params(params = {})
    params.merge({ headers: { username: ENV['USERNAME'] } })
  end

  def apply_business_rules(tweets, params = {})
    TweetBusinessRules.new(tweets)
      .filter(params[:search_term], params[:replay_exclude])
  end

  def parsed_tweets(response)
    TweetSerializer.new(
      JSON.parse(response.body)['statuses']
    ).tweets
  end

  def filter_params
    {
      search_term: 'locaweb',
      replay_exclude: true
    }
  end
end
