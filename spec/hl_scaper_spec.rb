require_relative "spec_helper"

describe HackerNewsScraper do 
  
  # FUUUUUCK. TODO: Replace all this ARGV bullshit with a stub for the url

  describe '#initialize' do
    it "should have a url" do
      ARGV[0] = "post.html"
      page = HackerNewsScraper.new
      expect(page.url).to eq("post.html")
    end

    it "should have a page that is a Nokogiri instance" do
      ARGV[0] = "post.html"
      page = HackerNewsScraper.new
      expect(page.page).to be_a(Nokogiri::HTML::Document)      
    end
  end

  describe '#get_data' do
    it "Should return a Nokogiri instance" do
      ARGV[0] = "post.html"
      page = HackerNewsScraper.new
      expect(page.get_data).to be_a(Nokogiri::HTML::Document)
    end
  end

  describe '#strip_post_title' do
    it 'Should return an string' do
      ARGV[0] = 'post.html'
      page = HackerNewsScraper.new
      expect(page.strip_post_title).to be_a(String)
    end
  end

  describe '#strip_post_author' do
    it "Should return a string" do
      ARGV[0] = 'post.html'
      page = HackerNewsScraper.new
      expect(page.strip_post_author).to eq("purpleturtle")
    end
  end

  describe '#strip_post_id' do
    it 'Should return an Fixnum' do
      ARGV[0] = 'post.html'
      page = HackerNewsScraper.new
      expect(page.strip_post_id).to be_a(Fixnum)
    end
  end

  describe '#strip_post_url' do
    it "Should return a String" do
      ARGV[0] = 'post.html'
      page = HackerNewsScraper.new
      expect(page.strip_post_url).to be_a(String)
    end
  end

  describe '#strip_post_points' do
    it "Should return a Fixnum" do
      ARGV[0] = 'post.html'
      page = HackerNewsScraper.new
      expect(page.strip_post_points).to be_a(Fixnum)
    end
  end

  describe '#strip_post_comments' do
    it "Should return an Array" do
      ARGV[0] = 'post.html'
      page = HackerNewsScraper.new     
      expect(page.strip_post_comments).to be_a(Array)
    end
  end

  describe '#create_post' do
    it "should return a new Post instance" do
      ARGV[0] = 'post.html'
      page = HackerNewsScraper.new
      expect(page.create_post).to be_a(Post)      
    end
  end

  # describe '#display_results' do
  #   it "Should return a String" do
  #     ARGV[0] = 'post.html'
  #     page = HackerNewsScraper.new
  #     expect(page.display_results).to be_a(String)
  #   end
  # end
end

