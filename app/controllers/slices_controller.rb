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
            if @story.done?
                redirect_to @story, :notice => "The story is done!"
            else
                redirect_to @story
            end
        else
            flash[:errors] = @slice.errors.full_messages
            flash[:body] = @slice.body
            redirect_to @story
        end
    end

end
