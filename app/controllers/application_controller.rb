class ApplicationController < ActionController::Base
    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy, :new, :seed, :index, :home]
    before_action :set_previous_url, only: [:new]

    def set_previous_url
        session[:user_previous_url] = URI(request.referer || '').path
    end
end
