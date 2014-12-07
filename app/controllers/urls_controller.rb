class UrlsController < ApplicationController
  before_action :load_url, only: :redirect

  def new
    @url = Url.new
  end

  def create
    @url = Url.find_or_initialize_by(url_params)
    if @url.save
      render json: @url.to_json, status: 200
    else
      render json: { errors: @url.errors.full_messages }, status: 422
    end
  end

  def redirect
    redirect_to @url.target, status: 301
  end

  private
    def load_url
      @url = Url.where(code: params[:code]).first
      unless @url
        render nothing: true, status: 404
      end
    end

    def url_params
      params.require(:url).permit(:target)
    end
end
