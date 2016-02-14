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

    it "A post should have points" do
      expect(@post.points).to eq(100)
    end

    # Test for comments
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
  
  ####################
  # Refactoring Spec #
  ####################
  
  describe "Class Methods" do

    before :each do
      url = 'post.html'
      @page = Post.get_data(url)
    end

    describe '#get_data' do
      it "Should return a Nokogiri instance" do
        expect(@page).to be_a(Nokogiri::HTML::Document)
      end
    end

    describe '#strip_title' do
      it 'Should return an string' do
        page = HackerNewsScraper.new     
        expect(Post.strip_title(@page)).to be_a(String)
      end
    end

    describe '#strip_post_author' do
      it "Should return a string" do
        expect(Post.strip_author(@page)).to eq("purpleturtle")
      end
    end

    describe '#strip_id' do
      it 'Should return an Fixnum' do
        expect(Post.strip_id(@page)).to be_a(Fixnum)
      end
    end

    describe '#strip_url' do
      it "Should return a String" do
        expect(Post.strip_url(@page)).to be_a(String)
      end
    end

    describe '#strip_points' do
      it "Should return a Fixnum" do
        expect(Post.strip_points(@page)).to be_a(Fixnum)
      end
    end

    describe '#strip_comments' do
      it "Should return an Array" do
        expect(Post.strip_comments(@page)).to be_a(Array)
      end
    end

    describe '#create_post' do
      it "should return a new Post instance" do
        attributes = ['Post title', 'https://url.com', 'Some_Author', 12345, 100, [1,2,3,4,5]]
        @post = Post.create_post(attributes)
        expect(@post).to be_a(Post)      
      end
    end
  end
end