class HomeController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def save
    # Check if we have custom alias
    if params[:alias].nil?
      # if no custom alias Generate a unique one
      link_alias = Url.generate_alias
    elsif params[:custom] && params[:alias] != '' && params[:alias].length <= 16
      # Check if the custom alias is valid
      if Url.check_alias(params[:alias])
        link_alias = params[:alias]
      else
        redirect_to root_path, alert: ['Alias already exists'] and return
      end
    # Check if the custom alias is unique
    else
      redirect_to root_path, alert: ['Invalid Alias'] and return
    end
    @generate = current_user.urls.new(alias: link_alias, original_link: params[:url])
    if @generate.save
      # If the model saves, redirect to the index action
      redirect_to root_path, info: "https://www.url.chala.dev/#{@generate.alias}"
    else
      # Otherwise render the erros
      redirect_to root_path, alert: @generate.errors.full_messages
    end
  end

  def redirect
    # Get the URL from the form
    p = params[:id]
    @url = Url.find_by(alias: p)
    if @url
      @url.visits.create!
      redirect_to @url.original_link, allow_other_host: true
    else
      redirect_to root_path
    end
  end
end
