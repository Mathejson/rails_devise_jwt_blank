require 'httparty'

class RedditClient
  include HTTParty
  base_uri 'https://www.reddit.com'

  def initialize
    @options = { headers: { 'User-Agent' => 'RedditClient/1.0' } }
  end

  def get_top_posts(subreddit, limit = 10)
    options = @options.merge({ query: { limit: limit } })
    self.class.get("/r/#{subreddit}/top.json", options)
  end
end