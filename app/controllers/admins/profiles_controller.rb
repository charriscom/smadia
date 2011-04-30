class Admins::ProfilesController < AdminController
  # GET /admin/profiles
  # GET /admin/profiles.xml
  def index
    @profiles = Profile.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @profiles }
      format.xls  {ModelXls.new(Profile) ;send_file "#{Rails.root}/tmp/xls/Profiles.xls"}
    end
  end

  # GET /admin/profiles/1
  # GET /admin/profiles/1.xml
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @profile }
    end
  end

  # GET /admin/profiles/new
  # GET /admin/profiles/new.xml
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @profile }
    end
  end

  # GET /admin/profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /admin/profiles
  # POST /admin/profiles.xml
  def create
    @profile = Profile.new(params[:profile])
    respond_to do |format|
      if @profile.save
        format.html { redirect_to admins_profile_path(@profile, :notice => 'Profile was successfully created.') }
        format.xml  { render :xml => @profile, :status => :created, :location => @profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/profiles/1
  # PUT /admin/profiles/1.xml
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to admins_profile_path(@profile, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/profiles/1
  # DELETE /admin/profiles/1.xml
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(admins_profiles_path) }
      format.xml  { head :ok }
    end
  end
end
