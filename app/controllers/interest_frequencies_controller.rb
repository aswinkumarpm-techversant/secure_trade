class InterestFrequenciesController < ApplicationController
  def index
    @frequencies = InterestFrequency.all
  end
  #
  def show
    @frequency = InterestFrequency.find(params[:id])
  end

  def new
    @frequency = InterestFrequency.new

  end


  def edit
    @frequency = InterestFrequency.find(params[:id])
  end



  def create
    @frequency = InterestFrequency.new(frequency_params)

    if @frequency.save
      redirect_to @frequency
    else
      render 'new'
    end
  end

  def update
    @frequency = InterestFrequency.find(params[:id])

    if @frequency.update(frequency_params)
      redirect_to @frequency
    else
      render 'edit'
    end
  end

  def destroy
    @frequency = InterestFrequency.find(params[:id])
    @frequency.destroy

    redirect_to interest_frequencies_path
  end

  private

  def frequency_params
    params.require(:interest_frequency).permit(:frequency)
  end

end
