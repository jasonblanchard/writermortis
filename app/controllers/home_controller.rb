class HomeController < ApplicationController

    def home
        @complete_stories = Story.where("complete = ?", true).limit(5)
        @incomplete_stories = Story.where("complete = ?", false).limit(5)
    end 

end
