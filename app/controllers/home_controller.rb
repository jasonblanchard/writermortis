class HomeController < ApplicationController

    def home
        @complete_stories = Story.where("complete = ?", true).limit(10).order('created_at DESC')
        @incomplete_stories = Story.where("complete = ?", false).limit(10).order('created_at DESC')
        @excerpt = Story.all(:conditions => {:complete => true}).last

        if user_signed_in?
            @my_unfinished_stories = current_user.has_contributed_to_unfinished
            @my_finished_stories = current_user.has_contributed_to_finished

            render :template => 'home/logged_in_home'
        else
            render :template => 'home/home'
        end
    end

    def about
    end

end
