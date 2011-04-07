class Admins::MicrositesController < AdminController
  # GET /admins/microsites
  # GET /admins/microsites.xml
  def index
    @microsites = Microsite.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @microsites }
    end
  end

  # GET /admins/microsites/1
  # GET /admins/microsites/1.xml
  def show
    @microsite = Microsite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @microsite }
    end
  end

  # GET /admins/microsites/new
  # GET /admins/microsites/new.xml
  def new
    @microsite = Microsite.new
    @microsite.build_image
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @microsite }
    end
  end

  # GET /admins/microsites/1/edit
  def edit
    @microsite = Microsite.find(params[:id])
  end

  # POST /admins/microsites
  # POST /admins/microsites.xml
  def create
    @microsite = Microsite.new(params[:microsite])

    respond_to do |format|
      if @microsite.save
        format.html { redirect_to admins_microsite_path(@microsite, :notice => 'Microsite was successfully created.') }
        format.xml  { render :xml => @microsite, :status => :created, :location => @microsite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @microsite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admins/microsites/1
  # PUT /admins/microsites/1.xml
  def update
    @microsite = Microsite.find(params[:id])

    respond_to do |format|
      if @microsite.update_attributes(params[:microsite])
        format.html { redirect_to admins_microsite_path(@microsite, :notice => 'Microsite was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @microsite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/microsites/1
  # DELETE /admins/microsites/1.xml
  def destroy
    @microsite = Microsite.find(params[:id])
    @microsite.destroy

    respond_to do |format|
      format.html { redirect_to(microsites_url) }
      format.xml  { head :ok }
    end
  end
end
