require 'rails_helper'

describe TweetsHelper do
  let(:tweets) do
    [
      {
        id: "134792",
        favorited: true,
        retweet_count: 1,
        in_reply_to: "",
        date: "Mon Sep 24 03:35:21 +0000 2012",
        message: "@locaweb If we hack the panel, we can get to the SQL sensor through the cross-platform SSL interface!",
        user_mentions: 41,
        user: {
          id: "951437",
          name: "Keefe Mohammed O",
          screen_name: "keefe_mohammed_o",
          followers: 300,
          favourites_count: 90
        }
      }
    ].as_json.first
  end

  describe '.user_name' do
    let(:expected_link) do
      '<a target="_blank" href="https://twitter.com/keefemohammedo">Keefe Mohammed O</a>'
    end

    it 'return link to user profile' do
      expect(user_name(tweets)).to eq(expected_link)
    end
  end

  describe '.followers' do
    it 'return number to user followers' do
      expect(followers(tweets)).to eq(300)
    end
  end

  describe '.retweet_count' do
    it 'return number to retweets' do
      expect(retweet_count(tweets)).to eq(1)
    end
  end

  describe '.favourites_count' do
    it 'return number to favourites' do
      expect(favourites_count(tweets)).to eq(90)
    end
  end

  describe '.message' do
    let(:expected_message) do
      '@locaweb If we hack the panel, we can get to the SQL sensor through the cross-platform SSL interface!'
    end

    it 'return tweet message' do
      expect(message(tweets)).to eq(expected_message)
    end
  end

  describe '.posted_date' do
    let(:expected_date) do
      '<a target="_blank" href="https://twitter.com/keefemohammedo/status/134792">24-09-2012 às 03:35</a>'
    end

    it 'return link to user profile' do
      expect(posted_date(tweets)).to eq(expected_date)
    end
  end
end
