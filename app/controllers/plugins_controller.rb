class PluginsController < ApplicationController
  # GET /plugins
  # GET /plugins.xml
  def index
    @plugins = Plugin.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plugins }
    end
  end

  # GET /plugins/1
  # GET /plugins/1.xml
  def show
    @plugin = Plugin.find(params[:id], :include => :hosts)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plugin }
    end
  end
end
