require 'colorize'
require './lib/post'
require './lib/comment'
require './lib/user'

class HackerNewsScraper

  attr_reader :url, :post

  def initialize
    @url = ARGV[0]
    @post = construct_post
    display_result
  end

  def construct_post 
    page_data = Post.get_data(url)
    Post.create_post(page_data)
  end
    
  def display_result
    puts "\n--------------------------".colorize(:yellow)
    puts "\n > Post title:".colorize(:red) + " #{post.title}".colorize(:green)
    puts " > Post author:".colorize(:red) + " #{post.author}".colorize(:green)
    puts " > Post url:".colorize(:red) + " #{post.url}".colorize(:green)
    puts " > Post id:".colorize(:red) + " #{post.id}".colorize(:green)
    puts " > Number of Comments:".colorize(:red) + " #{post.comments_count}".colorize(:green)
    puts "\n--------------------------".colorize(:yellow)
    puts "\n > Display Comments? (y/n)".colorize(:yellow)
    input = STDIN.  gets.chomp
    display_comments if input.downcase == 'y'
  end

  def display_comments
    puts "\n > All comments".colorize(:red)
    post.comments.each do |comment|
      puts "#{comment.body}".colorize(:green) + " says".colorize(:yellow) + " #{comment.user}".colorize(:red)
    end
  end
end

HackerNewsScraper.new