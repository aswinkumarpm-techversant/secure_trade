class IssuersController < ApplicationController

  def index
    @issuers = Issuer.all
  end

  def show
    @issuer = Issuer.find(params[:id])
  end

  def new
    @issuer = Issuer.new

  end


  def edit
    @issuer = Issuer.find(params[:id])
  end



  def create
    @issuer = Issuer.new(issuer_params)

    if @issuer.save
      flash[:notice] = "Issuer was successfully created"
      redirect_to @issuer
    else
      render 'new'
    end
  end

  def update
    @issuer = Issuer.find(params[:id])

    if @issuer.update(issuer_params)
      redirect_to @issuer
    else
      render 'edit'
    end
  end

  def destroy
    @issuer = Issuer.find(params[:id])
    @issuer.destroy

    redirect_to issuers_path
  end

  private

  def issuer_params
    params.require(:issuer).permit(:name)
  end

end
