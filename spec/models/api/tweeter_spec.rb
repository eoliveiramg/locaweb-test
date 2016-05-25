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
        }).to_return(status: 200, body: "locaweb")
    end

    it 'returns true' do
      expect(Api::Tweeter.new('http://tweeps.locaweb.com.br/',
                              { headers: {
                                  username: 'eoliveiramg@gmail.com'
                                }
                              }
                             ).connect).to have_requested(:get, "http://tweeps.locaweb.com.br/").
        with(headers: {'Username' => 'eoliveiramg@gmail.com'})
    end

    it 'returns filtered tweets' do
       expect(Api::Tweeter.new('http://tweeps.locaweb.com.br/',
                              { headers: {
                                  username: 'eoliveiramg@gmail.com'
                                },
                                filter: 'locaweb'
                              }
                             ).connect.body).to eq('locaweb')
    end
  end
end
