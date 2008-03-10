class HostsController < ApplicationController
  def index
    @hosts = Host.find(:all)
  end

  def show
    @host = Host.find(params[:id], :include => { :vulnerabilities => :plugin })
  end
  
  def edit
    @host = Host.find(params[:id])
  end
  
  def update
    @host = Host.find(params[:id])

    respond_to do |format|
      if @host.update_attributes(params[:host])
        flash[:notice] = 'Host was successfully updated.'
        format.html { redirect_to(@host) }
      else
        flash[:notice] = 'Failed to update Host. Please try again.'
        format.html { render :action => "edit" }
      end
    end
  end
end
