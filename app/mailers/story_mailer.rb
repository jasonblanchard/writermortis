class StoryMailer < ActionMailer::Base
  default from: "writermortis@gmail.com"

  def new_slice(users, story)
      @users = emailable_users(users)
      @story = story
      mail(:bcc => @users, :subject => "New Part Added to \"#{@story.title}\"")
  end

  def completed_story(users, story)
      @users = emailable_users(users)
      @story = story
      mail(:bcc => @users, :subject => "\"#{@story.title}\" is Finished")
  end

  private

  def emailable_users(users)
      emailable_users = []
      users.each do |user|
          emailable_users << user if user.receive_emails?
      end
      emailable_users.map(&:email)
  end

end
