class Admin::UsersController < AdminController
 
  def index
    @users = User.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
  end
  
  def new
    @user = User.new
    @profiles = Profile.all
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Usuario creado exitosamente"
      redirect_to admin_users_path
    else
      flash[:error] = "Error al crear el usuario"
      render :new
    end
  end
  
  def show
    @user = User.find_by_id(params[:id])
  end
  
  def edit
    @user = User.find_by_id(params[:id])
    @profiles = Profile.all
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Usuario actualizado exitosamente"
      redirect_to admin_users_path
    else
      flash[:error] = "Error al actializar el usuario"
      render :edit
    end
  end

end
