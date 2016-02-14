require 'nokogiri'
require 'restclient'

class Post

  attr_reader :title, :url, :author, :id, :points, :comments

  def initialize(post_data)
    @title = post_data[:title]
    @url = post_data[:url]
    @author = post_data[:author] 
    @id = post_data[:id]
    @points = post_data[:points]
    @comments = post_data[:comments]
  end
    
  def comments_count
    @comments.count
  end

  # Returns a Nokogiri object of the requested url
  def self.get_data(url)
    Nokogiri::HTML(RestClient.get(url))
  end

  # Returns a new Post instance
  def self.create_post(post)
    Post.new({
      title: self.strip_title(post), 
      url: self.strip_url(post), 
      author: self.strip_author(post), 
      id: self.strip_id(post), 
      points: self.strip_points(post), 
      comments: self.strip_comments(post)
    })
  end

  # These methods strip content from the Nokogiri object
  def self.strip_title(page)
    page.css('td.title a')[0].text
  end

  def self.strip_author(page)
    page.css('.subtext a')[0].text
  end

  def self.strip_id(page)
    page.css('span.score')[0]['id'].match(/([0-9]*$)/)[0].to_i
  end

  def self.strip_url(page)
    page.css('td.title a')[0]['href']
  end

  def self.strip_points(page)
    page.css('span.score')[0].text.match(/(^[0-9]*)/)[0].to_i
  end

  def self.strip_comments(page)
    page.css('tr.athing').drop(1).map do |comment|
      user = comment.css('span.comhead > a').text
      body = comment.css('span.c00').text
      depth = comment.css('td.ind img')[0]['width'].to_i
      Comment.new({ user: user, depth: depth, body: body})
    end
  end

end