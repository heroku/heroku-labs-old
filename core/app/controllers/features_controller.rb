class FeaturesController < ApplicationController
  def index
  end
  
  def show
    @feature = Feature.by_name(params[:id]).first
    respond_to do |format|
      format.json { render :json => @feature }
    end
  end
  
  def enable
    @app = App.find(params[:app_id])
    @feature = Feature.by_name(params[:id]).first
  end
  
  def disable
    @app = App.find(params[:app_id])
    @feature = Feature.by_name(params[:id]).first
  end
end
