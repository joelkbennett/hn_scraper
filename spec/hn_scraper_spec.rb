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


  # describe '#display_results' do
  #   it "Should return a String" do
  #     ARGV[0] = 'post.html'
  #     page = HackerNewsScraper.new
  #     expect(page.display_results).to be_a(String)
  #   end
  # end
end

