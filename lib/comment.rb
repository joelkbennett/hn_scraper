class Comment

  attr_reader :user, :body, :depth

  def initialize(comment)
    @user = comment[:user]
    @depth = comment[:depth] / 40
    @body = format_body(comment[:body])
    @parent = nil
  end

  def format_body(body)
    str =  "|"
    str += "\n|" + ("--" * @depth) + " " + body.gsub(/-----/, "")[0, 50].strip + "..."   
  end

end 