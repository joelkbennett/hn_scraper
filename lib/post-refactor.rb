require 'nokogiri'

class Post

  attr_reader :title, :url, :author, :id, :points, :comments

  def initialize(title, url, author, id, points, comments)
    @title = title
    @url = url
    @author = author
    @id = id
    @points = points
    @comments = comments
  end

  # Process comment data
  # def get_comments(data)
    
  # end

  # def add_comments(comment)
  #   # add based on depth
  #   comments << comment
  # end
  
  def comments_count
    @comments.count
  end

end