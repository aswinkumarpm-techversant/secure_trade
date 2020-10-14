class SecurityTypesController < ApplicationController
  def index
    @securitytypes = SecurityType.all
  end

  def show
    @securitytype = SecurityType.find(params[:id])
  end

  def new
    @securitytype = SecurityType.new
  end

  def edit
    @securitytype = SecurityType.find(params[:id])
  end


  def create
    # render plain: params[:security_type].inspect
    @securitytype = SecurityType.new(security_types_params)

    if @securitytype.save
      redirect_to @securitytype
    else
      render 'new'
    end

  end

  def update
    @securitytype = SecurityType.find(params[:id])

    if @securitytype.update(security_types_params)
      redirect_to @securitytype
    else
      render 'edit'
    end
  end


  def destroy
    @securitytype = SecurityType.find(params[:id])
    @securitytype.destroy

    redirect_to security_types_path
  end

  private
  def security_types_params
    params.require(:security_type).permit(:name, :issuer_id)
  end
end
