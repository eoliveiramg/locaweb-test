class Api::Tweeter
  def initialize(uri, params = {})
    @uri = URI.parse uri
    @host = @uri.host
    @port = @uri.port
    @params = params
  end

  def connect
    Net::HTTP.start(@host, @port) do |http|
      @request = Net::HTTP::Get.new @uri

      headers if @params[:headers].present?

      response = http.request @request
    end
  end

  private
  def headers
    @params[:headers].each do |param|
      @request[param.first] = param.last.as_json
    end
  end
end
