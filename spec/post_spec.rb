require_relative "spec_helper"

describe Post do

  before :each do
    @post = Post.new('Post title', 'https://url.com', 'Some_Author', 12345, 100, [1,2,3,4,5])
  end
  
  describe '#initialize' do
    it "a post should have a title" do
      expect(@post.title).to be_a(String)
    end

    it "a post should have a url" do
      expect(@post.url).to be_a(String)
    end

    it "a post should have an id" do
      expect(@post.id).to be_a(Integer)
    end

    it "A new post should have 100 points" do
      expect(@post.points).to eq(100)
    end
  end

  describe '#comment_count' do
    it "Should return the number of comments in a post" do
      expect(@post.comments_count).to eq(5)
    end
  end

  # Change behaviors of this method so it actually outputs something
  # maybe keep an array of comment ids and get them on the fly
  # this needs more complicated logic = generate parent/child relationships
  # from depth
  # describe '#get_comments' do
  #   it "Should return an array of comments" do
  #     # expect(@post).to receive(:comments_data).and_return()
  #     data = instance_double(Nokogiri::HTML::Document)
  #     expect(@post.get_comments(data)).to be_a(Nokogiri::HTML::Document)
  #   end
  # end  
end