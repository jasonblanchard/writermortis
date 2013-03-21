class HomeController < ApplicationController

    def home
        @incomplete_stories = Story.list(false,5)
        @complete_stories = Story.list(true,5)
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
