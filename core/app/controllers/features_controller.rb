class FeaturesController < ApplicationController
  def index
    app = App.find(params[:app_id])
    enabled_features = app.tags.split(",")
    Feature.class_eval { attr :enabled, true }
    features = Feature.all
    features.each { |feature| feature.enabled = enabled_features.include? feature.name }
    respond_to do |format|
      format.json { render :json => features.to_json(:methods => :enabled) }
    end
  end
  
  def show
    feature = Feature.by_name(params[:id]).first
    respond_to do |format|
      format.json { render :json => feature }
    end
  end
  
  def enable
    app = App.find(params[:app_id])
    enabled_features = app.tags.split(",")
    feature_to_enable = Feature.by_name(params[:id]).first
    enabled_features << feature_to_enable.name
    app.tags = enabled_features.uniq.join(',')
    app.save
  end
  
  def disable
    app = App.find(params[:app_id])
    enabled_features = app.tags.split(",")
    feature_to_disable = Feature.by_name(params[:id]).first
    enabled_features.collect! { |feature| feature unless feature == feature_to_disable.name }
    app.tags = enabled_features.join(',')
    app.save
  end
end
