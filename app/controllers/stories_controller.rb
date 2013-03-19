class StoriesController < ApplicationController

    before_filter :authenticate_user!, :only => [:new, :create]

    def index
        @stories = Story.all
    end

    def show
        @story = Story.find(params[:id])

        @contributors = @story.contributors

        if @story.done?
            render :template => 'stories/finished_story_show'
        end

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

    def edit
        @story = current_user.stories.find(params[:id])
    end

    def update
        @story = current_user.stories.find(params[:id])
        @story.update_attributes(params[:story])

        if @story.save
            redirect_to @story
        else
            render :edit
        end
    end

end
