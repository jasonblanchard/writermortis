class SlicesController < ApplicationController
    def new
        @story = Story.find(params[:id])
    end
end
