class SlicesController < ApplicationController

    before_filter :authenticate_user!, :only => [:new, :create]

    def new
        @story = Story.find(params[:id])
    end

    def create
        @story = Story.find(params[:story_id])
        @slice = @story.slices.create(params[:slice])
        @slice.user_id = current_user.id

        if @slice.save
            update_story_status(@story)
            redirect_to @story
        else
            flash[:errors] = @slice.errors.full_messages
            flash[:body] = @slice.body
            redirect_to @story
        end
    end

    def update_story_status(story)
        if story.slices.length >= story.total_slices
            story.update_attributes(:complete => true)
        end
    end

end
