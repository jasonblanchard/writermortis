class HomeController < ApplicationController

    def home
        @complete_stories = Story.where("complete = ?", true).limit(10).order('created_at DESC')
        @incomplete_stories = Story.where("complete = ?", false).limit(10).order('created_at DESC')

        if user_signed_in?
            render :template => 'home/logged_in_home'
        else
            render :template => 'home/home'
        end
    end

end
