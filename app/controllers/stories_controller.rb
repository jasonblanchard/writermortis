class StoriesController < ApplicationController
    def index
        @stories = Story.all
    end

    def show
        @story = Story.find(params[:id])

        @complete_story = []

        @story.slices.each do |slice|
            @complete_story << slice.body
        end

        @complete_story = @complete_story.join(" ")

        @contributors = @story.users.uniq

    end

    def new
        @story = current_user.stories.new
    end

    def create
        @story = current_user.stories.new(params[:story])

        if @story.save
            redirect_to @story
        else
            render :new
        end
    end

end
