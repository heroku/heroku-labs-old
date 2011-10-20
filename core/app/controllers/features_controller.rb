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
    respond_to { |format| format.json { render :json => feature } }
  end
  
  def enable
    app = App.find(params[:app_id])
    enabled_features = app.tags.split(",")
    Feature.class_eval { attr :enabled, true }
    feature = Feature.by_name(params[:id]).first
    enabled_features << feature.name
    app.tags = enabled_features.uniq.join(',')
    feature.enabled = true if app.save
    respond_to do |format|
      format.json { render :json => feature.to_json(:methods => :enabled) }
    end
  end
  
  def disable
    app = App.find(params[:app_id])
    enabled_features = app.tags.split(",")
    Feature.class_eval { attr :enabled, true }
    feature = Feature.by_name(params[:id]).first
    enabled_features.collect! { |f| f unless f == feature.name }
    app.tags = enabled_features.join(',')
    feature.enabled = false if app.save
    respond_to do |format|
      format.json { render :json => feature.to_json(:methods => :enabled) }
    end
  end
end
