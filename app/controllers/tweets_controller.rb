class TweetsController < ApplicationController

  def index
    request = Api::Tweeter.new('http://tweeps.locaweb.com.br/', request_params)
    response = request.connect
    
    @tweets = JSON.parse(response.body)['statuses']
  end

  private
  def request_params(params = {})
    params.merge({ headers: { username: ENV['USERNAME'] } })
  end
end
