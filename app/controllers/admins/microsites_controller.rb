class Admins::MicrositesController < AdminController
  
  uses_tiny_mce 
  
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
    build_microsite(@microsite)
    @categories = Category.all
    @microsites = Microsite.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @microsite }
    end
  end

  # GET /admins/microsites/1/edit
  def edit
    @microsite = Microsite.find(params[:id])
    @microsites = Microsite.where("id != ?",@microsite.id)
    @categories = Category.all
    build_microsite(@microsite)
  end

  # POST /admins/microsites
  # POST /admins/microsites.xml
  def create
    @microsite = Microsite.new(params[:microsite])
    @microsites = Microsite.all
    @categories = Category.all
    build_microsite(@microsite)
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
    @microsites = Microsite.where("id != ?",@microsite.id)
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
  
  private
    
    def build_microsite(microsite)
      microsite.build_image if microsite.image.nil?
      microsite.build_header if microsite.header.nil?
      microsite.build_space1 if microsite.space1.nil?
      microsite.build_space2 if microsite.space2.nil?
      microsite.build_space3 if microsite.space3.nil?
      microsite.build_space4 if microsite.space4.nil?
      microsite.build_footer if microsite.footer.nil?
      microsite.build_parent_microsite if microsite.parent_microsite.nil?
      microsite.build_category if microsite.category.nil?
    end
end
