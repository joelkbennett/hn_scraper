require_relative "spec_helper"

describe Comment do

  before :each do
    @comment = Comment.new('some_user', 'This is a really insightful comment', 0)
  end

  describe '#initialize' do
    it "A comment should have an author (user)" do
      expect(@comment.user).to eq('some_user')
    end

    it "A comment should have body content" do
      expect(@comment.body).to be_a(String)
    end

    it "A parent comment should have a depth of 0" do
      expect(@comment.depth).to eq(0)
    end

    it "A child comment should have depth 1" do
      child_comment = Comment.new('some_user', 'A reasons to a comment', 40)
      expect(child_comment.depth).to eq(1)
    end

    it "A child of a child should have depth 2" do
      child_child_comment = Comment.new('a_child', 'nothing to add', 80)
      expect(child_child_comment.depth).to eq(2)
    end
  end   

end