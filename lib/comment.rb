class Comment

  attr_reader :user, :body, :depth

  def initialize(user, body, depth)
    @user = user
    @body = body.gsub(/-----/, "").strip
    @depth = depth / 40
    # TODO: Add some way to get the parent
    #       Actually... it's kinda based on what's above it... so I should
    #       be able to get the parent based on @depth
  end



end 