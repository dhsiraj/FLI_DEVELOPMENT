class TopLinksController < ApplicationController
  # GET /top_links
  # GET /top_links.xml
  def index
    @top_links = TopLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @top_links }
    end
  end

  # GET /top_links/1
  # GET /top_links/1.xml
  def show
    @top_link = TopLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @top_link }
    end
  end

  # GET /top_links/new
  # GET /top_links/new.xml
  def new
    @top_link = TopLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @top_link }
    end
  end

  # GET /top_links/1/edit
  def edit
    @top_link = TopLink.find(params[:id])
  end

  # POST /top_links
  # POST /top_links.xml
  def create
    @top_link = TopLink.new(params[:top_link])

    respond_to do |format|
      if @top_link.save
        format.html { redirect_to(@top_link, :notice => 'Top link was successfully created.') }
        format.xml  { render :xml => @top_link, :status => :created, :location => @top_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @top_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /top_links/1
  # PUT /top_links/1.xml
  def update
    @top_link = TopLink.find(params[:id])

    respond_to do |format|
      if @top_link.update_attributes(params[:top_link])
        format.html { redirect_to(@top_link, :notice => 'Top link was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @top_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /top_links/1
  # DELETE /top_links/1.xml
  def destroy
    @top_link = TopLink.find(params[:id])
    @top_link.destroy

    respond_to do |format|
      format.html { redirect_to(top_links_url) }
      format.xml  { head :ok }
    end
  end
end
