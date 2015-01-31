class WigglesController < ApplicationController
  # GET /wiggles
  # GET /wiggles.xml
  def index
    @wiggles = Wiggle.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wiggles }
    end
  end

  # GET /wiggles/audit
  # GET /wiggles/audit.xml
  def audit
    @wiggles = Wiggle.all.reject do |wiggle|
      WiggleChecksummer.new(wiggle).valid?
    end

    respond_to do |format|
      format.html # audit.html.erb
      format.xml { render :xml => @wiggles }
    end
  end

  # GET /wiggles/1
  # GET /wiggles/1.xml
  def show
    @wiggle = Wiggle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wiggle }
    end
  end

  # GET /wiggles/new
  # GET /wiggles/new.xml
  def new
    @wiggle = Wiggle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wiggle }
    end
  end

  # GET /wiggles/1/edit
  def edit
    @wiggle = Wiggle.find(params[:id])
  end

  # POST /wiggles
  # POST /wiggles.xml
  def create
    @wiggle = Wiggle.new(params[:wiggle])

    respond_to do |format|
      if @wiggle.save
        format.html { redirect_to(@wiggle, :notice => 'Wiggle was successfully created.') }
        format.xml  { render :xml => @wiggle, :status => :created, :location => @wiggle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wiggle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wiggles/1
  # PUT /wiggles/1.xml
  def update
    @wiggle = Wiggle.find(params[:id])

    respond_to do |format|
      if @wiggle.update_attributes(params[:wiggle])
        format.html { redirect_to(@wiggle, :notice => 'Wiggle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wiggle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wiggles/1
  # DELETE /wiggles/1.xml
  def destroy
    @wiggle = Wiggle.find(params[:id])
    @wiggle.destroy

    respond_to do |format|
      format.html { redirect_to(wiggles_url) }
      format.xml  { head :ok }
    end
  end
end
