class StoryListSweeper < ActionController::Caching::Sweeper
    observe Story, Slice

    def after_create(record)
        if record.is_a?(Story)
            expire_fragment('recent_unfinished_stories')
            expire_list_caches
        elsif record.is_a?(Slice)
            expire_list_caches
        end
    end

    def after_update(record)
        if record.is_a?(Story)
            expire_list_caches
            expire_user_list_caches(record)
        end
    end

    def after_destroy(record)
        if record.is_a?(Story)
            expire_list_caches
            expire_user_list_caches(record)
        elsif record.is_a?(Slice)
            expire_list_caches
            expire_user_list_caches
        end
    end


    private

    def expire_user_list_caches(story=nil)

        current_user = User.find(session["warden.user.user.key"][1][0])

        expire_fragment("user_#{current_user.id}_#{current_user.updated_at.to_i}_unfinished_stories")
        expire_fragment("user_#{current_user.id}_#{current_user.updated_at.to_i}_finished_stories")
        if story
            story.contributors.each do |user|
                user.touch
            end 
        end
    end 

    def expire_list_caches
        expire_fragment("recent_unfinished_stories")
        expire_fragment("recent_finished_stories")
    end

end
