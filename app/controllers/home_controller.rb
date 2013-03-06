class HomeController < ApplicationController

    def home
        @stories = Story.all
    end 

end
