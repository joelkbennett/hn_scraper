require 'nokogiri'
require 'restclient'
require 'colorize'
require './lib/post'
require './lib/comment'
require './lib/user'

class HackerNewsScraper

  attr_reader :url, :page

  def initialize
    @url = ARGV[0]
    @page = get_data
    display_result(create_post)
  end

  # Returns a Nokogiri object of the requested url
  def get_data
    Nokogiri::HTML(open(url))
    # Nokogiri::HTML(RestClient.get(url))
  end

  # Returns a new Post instance
  # TODO: Add the post author via strip_post_author
  def create_post
    Post.new(strip_post_title, strip_post_url, strip_post_author, strip_post_id, strip_post_points, strip_post_comments)
  end

  # TODO: Consider moving these to Post; pass a post in only and do the
  # stripping there -- class methods are a good choice
  # yeah, do that

  def strip_post_title
    @page.css('td.title a')[0].text
  end

  def strip_post_author
    @page.css('.subtext a')[0].text
  end

  def strip_post_id
    @page.css('span.score')[0]['id'].match(/([0-9]*$)/)[0].to_i
  end

  def strip_post_url
    @page.css('td.title a')[0]['href']
  end

  def strip_post_points
    @page.css('span.score')[0].text.match(/(^[0-9]*)/)[0].to_i
  end

  def strip_post_comments
    @page.css('tr.athing').drop(1).map do |comment|
      user = comment.css('span.comhead > a').text
      text = comment.css('span.c00').text
      depth = comment.css('td.ind img')[0]['width'].to_i
      Comment.new(user, text, depth)
    end
  end

  # Display Methods
  def display_result(post)
    rand_roll = rand(post.comments_count - 1)
    puts "\n--------------------------".colorize(:red)
    puts "\nPost title:".colorize(:red) + " #{post.title}".colorize(:green)
    puts "Post author:".colorize(:red) + " #{post.author}".colorize(:green)
    puts "Post url:".colorize(:red) + " #{post.url}".colorize(:green)
    puts "Post id:".colorize(:red) + " #{post.id}".colorize(:green)
    puts "Post comments:".colorize(:red) + " #{post.comments_count}".colorize(:green)
    puts "\nWhat are comments?".colorize(:red) + "  #{post.comments[0].class}".colorize(:green)
    
    # puts "\nShow me a random comment:".colorize(:red)
    # puts "\nBy #{post.comments[rand_roll].user}".colorize(:green) + " #{post.comments[rand_roll].depth}"
    # puts "\n#{post.comments[rand_roll].body}".colorize(:green)
    
    puts "\nAll comments".colorize(:red)
    post.comments.each do |comment|
      puts "#{comment.body} says #{comment.user}"
    end

    puts "\n--------------------------\n\n".colorize(:red)
  end

end

HackerNewsScraper.new