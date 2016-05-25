require 'rails_helper'
require 'webmock/rspec'

describe Api::Tweeter do
  describe '.connect' do
    before do
      stub_request(:get, "http://tweeps.locaweb.com.br/").
        with(headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host' => 'tweeps.locaweb.com.br',
          'User-Agent' => 'Ruby',
          'Username' => 'eoliveiramg@gmail.com'
        }).to_return(status: 200, body: "")
    end
    
    it 'honor request api' do
      expect(Api::Tweeter.new.connect).to have_requested(:get, "http://tweeps.locaweb.com.br/").
        with(headers: {'Username' => 'eoliveiramg@gmail.com'})
    end
  end
end
