class HomeController < ApplicationController

    def home
        @stories = Story.find(:all, :limit => 5)
    end 

end
