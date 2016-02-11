class Comment

  attr_reader :user, :body, :depth

  def initialize(user, body, depth)
    @user = user
    @depth = depth / 40
    @body = "|" + ("--" * @depth) + " " + body.gsub(/-----/, "")[0, 80].strip + "..."
  end

end 