class PluginClassificationsController < ApplicationController
  def index
    @plugin_classifications = PluginClassification.find(:all,
                                                 :include => [:risk, :classification, :family])
  end

  def edit
    @plugin_classification = PluginClassification.find(params[:id])
  end

  def update
    @plugin_classification = PluginClassification.find(params[:id])

    respond_to do |format|
      if @plugin_classification.update_attributes(params[:plugin_classification])
        flash[:notice] = 'Classification was successfully updated.'
        format.html { redirect_to(:action => :index) }
      else
        flash[:error] = 'Failed to update classification. Please try again.'
        format.html { render(:action => :edit) }
      end
    end
  end
end