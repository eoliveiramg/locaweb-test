class Api::Tweeter
  def connect
    uri = URI.parse ENV['TWEETER_URI']
    params = { username: ENV['USERNAME'] }

    request(uri, params)
  end

  private
  def request(uri, params = {})
    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Get.new uri
      request['username'] = params[:username]

      response = http.request request
    end
  end
end
