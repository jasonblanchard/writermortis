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

                expire_list_caches

            else
                redirect_to @story
                StoryMailer.new_slice(@story.contributors, @story).deliver
            end

            expire_user_list_caches
            expire_list_caches

        else
            flash[:errors] = @slice.errors.full_messages
            flash[:body] = @slice.body
            redirect_to @story
        end
    end

    def destroy
        @story = Story.find(params[:story_id])
        @slice = Slice.find(params[:id])

        expire_user_list_caches
        expire_list_caches

        @slice.destroy

        redirect_to @story, :notice => "Successfully deleted that part"
    end

    private

    def expire_user_list_caches

        expire_fragment("user_#{current_user.id}_#{current_user.updated_at.to_i}_unfinished_stories")
        expire_fragment("user_#{current_user.id}_#{current_user.updated_at.to_i}_finished_stories")
        @story.contributors.each do |user|
            user.touch
        end
    end

    def expire_list_caches
        expire_fragment("recent_unfinished_stories")
        expire_fragment("recent_finished_stories")
    end
end
