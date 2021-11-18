class Admin::EstadosController < ApplicationController
  
  layout 'admin_layout'
  before_action :set_estado, only: [:show, :edit, :update, :destroy]
  
#GET  /ROLES
  def index
    @estados = Estado.all
  end

#GET /ROLES/NEW
  def new
    @estado = Estado.new
  end

#GET /ROLES/:ID
  def show
  end

#GET /ROLES/:ID/EDIT
  def edit
  end

# POST /ROLES
  def create
    @estado = Estado.new(params_estado)
    if @estado.save
      redirect_to admin_estados_path
    else
      render :new
    end
  end

# PUT / PATCH  /ROLES/:ID
  def update
    if @estado.update(params_estado)
      redirect_to admin_estado_path
    else
      render :edit
    end
  end

#DELETE /ROLES/:ID
  def destroy
    @estado.destroy
    redirect_to admin_estado_path
  end

  private
  def params_estado
    params.require(:estado).permit(:description)
  end

  def set_estado
    @estado = Estado.find(params[:id])
  rescue
    # el flash es como el mensajero de rails
    flash[:set_estado_error] = "Could not find the record #{params[:id]}"
    redirect_to admin_estados_path
  end

end
