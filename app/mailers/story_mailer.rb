class StoryMailer < ActionMailer::Base
  default from: "writermortis@gmail.com"

  def new_slice(users, story)
      @users = []
      users.each do |user|
          @users << user if user.receive_emails?
      end
      @users = @users.map(&:email)
      @story = story
      mail(:to => @users, :subject => "New Part Added to \"#{@story.title}\"")
  end

end
