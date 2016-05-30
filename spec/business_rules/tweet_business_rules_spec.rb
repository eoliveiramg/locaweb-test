require 'rails_helper'

describe TweetBusinessRules do
  context '.filter' do
    context 'when filter include tweets reply' do
      subject(:tweets) do
        TweetBusinessRules.new(entrie_tweets[:tweets])
          .filter('locaweb', false)
      end

      it 'returns tweets, include tweets replay' do
        expect(tweets).to eq(expect_result_1)
      end
    end
    
    context 'when filter exclude tweets replay' do
      subject(:tweets) do
        TweetBusinessRules.new(entrie_tweets[:tweets])
          .filter('locaweb', true)
      end

      it 'returns filter tweets' do
        expect(tweets).to eq(expect_result_2)
      end
    end
  end

  context '.sort' do
    subject(:tweets) do
      TweetBusinessRules.new(entrie_tweets[:tweets]).sort
    end

    it 'returns sort tweets' do
      expect(tweets).to eq(expect_result_3)
    end
  end
end

def entrie_tweets
  {
    tweets: [
      {
        id: "174899",
        favorited: true,
        retweet_count: 2,
        in_reply_to: "127392",
        date: "Mon Sep 24 03:35:21 +0000 2012",
        message: "@locaweb If we hack the panel, we can get to the SQL sensor through the cross-platform SSL interface!",
        user_mentions: 30,
        user: {
          id: "254438",
          name: "Keefe Mohammed O",
          screen_name: "keefe_mohammed_o",
          followers: 100,
          favourites_count: 76
        }
      },
      {
        id: "573791",
        favorited: true,
        retweet_count: 3,
        in_reply_to: "8360832",
        date: "Mon Sep 24 03:35:21 +0000 2012",
        message: "If we hack the panel, we can get to the SQL sensor through the cross-platform SSL interface!",
        user_mentions: 42,
        user: {
          id: "254438",
          name: "Keefe Mohammed O",
          screen_name: "keefe_mohammed_o",
          followers: 200,
          favourites_count: 70
        }
      },
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
      },
      {
        id: "134712",
        favorited: true,
        retweet_count: 4,
        in_reply_to: "",
        date: "Mon Sep 24 03:35:21 +0000 2012",
        message: "If we hack the panel, we can get to the SQL sensor through the cross-platform SSL interface!",
        user_mentions: 42,
        user: {
          id: "951437",
          name: "Keefe Mohammed O",
          screen_name: "keefe_mohammed_o",
          followers: 400,
          favourites_count: 50
        }
      }
    ]
  }
end

def expect_result_1
  [
    {
      id: "174899",
      favorited: true,
      retweet_count: 2,
      in_reply_to: "127392",
      date: "Mon Sep 24 03:35:21 +0000 2012",
      message: "@locaweb If we hack the panel, we can get to the SQL sensor through the cross-platform SSL interface!",
      user_mentions: 30,
      user: {
        id: "254438",
        name: "Keefe Mohammed O",
        screen_name: "keefe_mohammed_o",
        followers: 100,
        favourites_count: 76
      }
    },
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
  ].as_json
end

def expect_result_2
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
  ].as_json
end

def expect_result_3
  [
    {
      id: "573791",
      favorited: true,
      retweet_count: 3,
      in_reply_to: "8360832",
      date: "Mon Sep 24 03:35:21 +0000 2012",
      message: "If we hack the panel, we can get to the SQL sensor through the cross-platform SSL interface!",
      user_mentions: 42,
      user: {
        id: "254438",
        name: "Keefe Mohammed O",
        screen_name: "keefe_mohammed_o",
        followers: 200,
        favourites_count: 70
      }
    },
    {
      id: "134712",
      favorited: true,
      retweet_count: 4,
      in_reply_to: "",
      date: "Mon Sep 24 03:35:21 +0000 2012",
      message: "If we hack the panel, we can get to the SQL sensor through the cross-platform SSL interface!",
      user_mentions: 42,
      user: {
        id: "951437",
        name: "Keefe Mohammed O",
        screen_name: "keefe_mohammed_o",
        followers: 400,
        favourites_count: 50
      }
    },
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
    },
    {
      id: "174899",
      favorited: true,
      retweet_count: 2,
      in_reply_to: "127392",
      date: "Mon Sep 24 03:35:21 +0000 2012",
      message: "@locaweb If we hack the panel, we can get to the SQL sensor through the cross-platform SSL interface!",
      user_mentions: 30,
      user: {
        id: "254438",
        name: "Keefe Mohammed O",
        screen_name: "keefe_mohammed_o",
        followers: 100,
        favourites_count: 76
      }
    }
  ].as_json
end
