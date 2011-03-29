class UsersController < ApplicationController
 
  def index
    @users = User.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 5
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Usuario creado exitosamente"
      redirect_to users_path
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
  end
  
  def update
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Usuario actualizado exitosamente"
      redirect_to users_path
    else
      flash[:error] = "Error al actializar el usuario"
      render :edit
    end
  end

end
