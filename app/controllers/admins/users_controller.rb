class Admins::UsersController < AdminController
  # GET /admin/users
  # GET /admin/users.xml
  def index
    @users = User.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @users }
      format.xls  {UsersXls.new ;send_file "#{Rails.root}/tmp/xls/users.xls"}
    end
  end

  # GET /admin/users/1
  # GET /admin/users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @user }
    end
  end

  # GET /admin/users/new
  # GET /admin/users/new.xml
  def new
    if Profile.count == 0
      flash[:error] = "Debe Existir un Perfil antes de crear un usuario"
      return redirect_to admins_users_path() 
    end
    @user = User.new
    @user.build_profile
    @profiles = Profile.all

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @user }
    end
  end

  # GET /admin/users/1/edit
  def edit
    @user = User.find(params[:id])
    @profiles = Profile.all
  end

  # POST /admin/users
  # POST /admin/users.xml
  def create
    @user = User.new(params[:user])
    @profiles = Profile.all
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to admins_user_path(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/users/1
  # PUT /admin/users/1.xml
  def update
    @user = User.find(params[:id])
    @profiles = Profile.all
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admins_user_path(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(admins_users_path) }
      format.xml  { head :ok }
    end
  end
end
 
