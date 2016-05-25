class Api::Tweeter
  def initialize(uri, params = {})
    @uri_parsed = URI.parse uri

    @host = @uri_parsed.host
    @port = @uri_parsed.port
    @params = params
  end

  def connect
    Net::HTTP.start(@host, @port) do |http|
      filters if @params[:filter].present?

      @request = Net::HTTP::Get.new @uri_parsed

      headers if @params[:headers].present?

      response = http.request @request
    end
  end

  private
  def request(uri, params = {})
    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Get.new uri
      request['username'] = params[:username]

      response = http.request request
    end
  end

  def headers
    @params[:headers].each do |param|
      @request[param.first] = param.last.as_json
    end
  end

  def filters
    @uri_parsed.host + "/search?q=%40#{@params[:filter]}"
  end
end
