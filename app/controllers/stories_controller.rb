class StoriesController < ApplicationController

    before_filter :authenticate_user!, :only => [:new, :create]

    caches_action :show, :cache_path => proc { |c|
        post = Story.find(c.params[:id])
        {:tag => post.updated_at.to_i}
    }

    def index
        @complete_stories = Story.list(true,20)
        @incomplete_stories = Story.list(false,20)
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
            redirect_to @story, :notice => "Story successfully updated."
        else
            render :edit
        end
    end

    def destroy
        @story = current_user.stories.find(params[:id])
        @story.destroy

        redirect_to :root, :notice => "Story deleted."
    end

end
