class HomeController < ApplicationController

    def home
        @complete_stories = Story.where("complete = ?", true).limit(5).order('created_at DESC')
        @incomplete_stories = Story.where("complete = ?", false).limit(5).order('created_at DESC')
    end 

end
