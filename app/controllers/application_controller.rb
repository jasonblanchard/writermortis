class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :http_authenticate

    def http_authenticate
        if Rails.env.staging?
            authenticate_or_request_with_http_basic do |username, password|
                username == ENV['HTTP_USERNAME'] && password == ENV['HTTP_PASSWORD']
            end
        end
    end
end
