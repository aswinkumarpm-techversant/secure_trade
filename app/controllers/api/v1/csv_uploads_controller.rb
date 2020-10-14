class Api::V1::CsvUploadsController < ApplicationController
  include(Api::V1::CsvUploadsHelper)
  def index
    @csv_files = CsvUpload.all
    # render json:@csv_files
  end

  def show
    @csv_file = CsvUpload.find(params[:id])
    # render json:@csv_file


  end

  def create
    @csv_file = CsvUpload.new(csv_params)
    if @csv_file.save
      render json: {msg: ' The CSV File is successfully uploaded!!'}
    else
      render error: {error: "Unable to add File"},status:400
    end
  end

  # def update
  #   @csv_file = CsvUpload.find(params[:id])
  #   if @csv_file
  #     @csv_file.update(csv_params)
  #     render json: {message: ' The CSV File is successfully Updated!!'}, status:200
  #   else
  #     render error: {error: "Unable to add File"},status:400
  #   end
  #
  # end
  #

  def export_csv
    @csv_file = CsvUpload.find(params[:id])
    if @csv_file
      puts "called here", @csv_file.inspect
    end

    export(@csv_file.csvfile.path)
    flash[:success] = "CSV Import Successful"
    redirect_to securities_path
  end

  # def destroy
  #   @csv_file = CsvUpload.find(params[:id])
  #   if @csv_file
  #     @csv_file.destroy
  #     render json: {message: ' The CSV File is successfully Deleted!!'}, status:200
  #   else
  #     render error: {error: "Unable to Delete File"},status:400
  #   end
  #

  # end
  def csv_params
    params.permit( :csvfile)
  end
end

