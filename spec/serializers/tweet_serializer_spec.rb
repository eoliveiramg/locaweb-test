require 'rails_helper'

describe TweetSerializer do
  let(:tweet_entrie) do
    [{
        "coordinates"=>nil,
        "favorited"=>true,
        "truncated"=>false,
        "created_at"=>"Mon Sep 24 03:35:21 +0000 2012",
        "id_str"=>"174899",
        "entities"=>{"urls"=>[], "hashtags"=>[], "user_mentions"=>[]},
        "in_reply_to_user_id_str"=>"",
        "contributors"=>nil,
        "text"=>"If we hack the panel, we can get to the SQL sensor through the cross-platform SSL interface!",
        "metadata"=>{"iso_language_code"=>"pt", "result_type"=>"recent"},
        "retweet_count"=>0,
        "in_reply_to_status_id_str"=>"",
        "id"=>174899,
        "geo"=>nil,
        "retweeted"=>false,
        "in_reply_to_user_id"=>nil,
        "place"=>nil,
        "user"=>
          {
            "profile_sidebar_fill_color"=>"DDEEF6",
            "profile_sidebar_border_color"=>"C0DEED",
            "profile_background_tile"=>false,
            "name"=>"Keefe Mohammed O",
            "profile_image_url"=>
            "http://a0.twimg.com/profile_images/2359746665/1v6zfgqo8g0d3mk7ii5s_normal.jpeg",
            "created_at"=>"Mon Apr 26 06:01:55 +0000 2010",
            "location"=>"LA, CA",
            "follow_request_sent"=>nil,
            "profile_link_color"=>"0084B4",
            "is_translator"=>false,
            "id_str"=>"254438",
            "entities"=>
              {"url"=>{"urls"=>[{"expanded_url"=>nil, "url"=>"", "indices"=>[0, 0]}]},
            "description"=>{"urls"=>[]}},
            "default_profile"=>true,
            "contributors_enabled"=>false,
            "favourites_count"=>76,
            "url"=>nil,
            "profile_image_url_https"=>
            "https://si0.twimg.com/profile_images/2359746665/1v6zfgqo8g0d3mk7ii5s_normal.jpeg",
            "utc_offset"=>-28800,
            "id"=>254438,
            "profile_use_background_image"=>true,
            "listed_count"=>2,
            "profile_text_color"=>"333333",
            "lang"=>"en",
            "followers_count"=>612,
            "protected"=>false,
            "notifications"=>nil,
            "profile_background_image_url_https"=>
            "https://si0.twimg.com/images/themes/theme1/bg.png",
            "profile_background_color"=>"C0DEED",
            "verified"=>false,
            "geo_enabled"=>true,
            "time_zone"=>"Pacific Time (US & Canada)",
            "description"=>"Born 330 Live 310",
            "default_profile_image"=>false,
            "profile_background_image_url"=>"http://a0.twimg.com/images/themes/theme1/bg.png",
            "statuses_count"=>579,
            "friends_count"=>612,
            "following"=>nil,
            "show_all_inline_media"=>false,
            "screen_name"=>"keefe_mohammed_o"
          },
        "in_reply_to_screen_name"=>"",
        "source"=>"web",
        "in_reply_to_status_id"=>nil
    }]
  end

  let(:expected_response) do
    {
      tweets: [
        {
          id: "174899",
          favorited: true,
          retweet_count: 0,
          date: "Mon Sep 24 03:35:21 +0000 2012",
          message: "If we hack the panel, we can get to the SQL sensor through the cross-platform SSL interface!",
          user: {
          id: "254438",
          name: "Keefe Mohammed O",
          followers: 612
          }
        }
      ]
    }
  end

    it 'returns parsed tweet' do
      expect(TweetSerializer.new(tweet_entrie).as_json).to eq(expected_response.as_json)
    end
end
