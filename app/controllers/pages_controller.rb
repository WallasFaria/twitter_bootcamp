class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @tweet = current_user.tweets.new if user_signed_in?
  end
end
