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
                redirect_to @story, :notice => "You finished the story!"
                StoryMailer.completed_story(@story.contributors, @story).deliver
            else
                redirect_to @story
                StoryMailer.new_slice(@story.contributors, @story).deliver
            end
        else
            flash[:errors] = @slice.errors.full_messages
            flash[:body] = @slice.body
            redirect_to @story
        end
    end

    def destroy
        @story = Story.find(params[:story_id])
        @slice = Slice.find(params[:id])
        @slice.destroy

        redirect_to @story, :notice => "Successfully deleted that part"
    end

end
