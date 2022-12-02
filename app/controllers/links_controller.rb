class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = current_user.urls
  end

  def details
   
    if current_user.urls.exists?(params[:id])
      @link = current_user.urls.find(params[:id])
      @visits = @link.visits.group("DATE(created_at)").count
      p @visits

    else
      redirect_to links_path, alert: "You don't have access to this link or link doesn't exist"
    end
  end
end
