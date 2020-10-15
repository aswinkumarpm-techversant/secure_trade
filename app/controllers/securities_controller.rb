class SecuritiesController < ApplicationController
  def index
    @securities = Security.page params[:page]
  end

  def show
    @security = Security.find(params[:id])
  end

  def new
    @security = Security.new
  end

  def edit
    @security = Security.find(params[:id])
  end


  def create
    # render plain: params[:security].inspect
    @security = Security.new(security_params)

    if @security.save
      redirect_to @security
    else
      render 'new'
    end

  end

  def update
    @security = Security.find(params[:id])

    if @security.update(security_params)
      redirect_to @security
    else
      render 'edit'
    end
  end


  def destroy
    @security = Security.find(params[:id])
    @security.destroy

    redirect_to securities_path
  end

  private
  def security_params
    params.require(:security).permit(:security_name, :isin, :issue_date, :maturity_date, :outstanding_stock, :face_value,:coupon_rate, :issuer_id, :security_type_id, :interest_frequency_id )
  end
end
