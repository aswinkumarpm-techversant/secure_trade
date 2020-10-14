class Api::V1::CsvUploadsController < ApplicationController
  def index
    @csv_files = CsvUpload.all
    # render json:@csv_files
  end

  def show
    @csv_file = CsvUpload.find(params[:id])
    if @csv_file
      puts "called here"
    end
    n = 0
    rowarray = Array.new
    if params[:csvfile]
      puts "File is There"
    else
      puts "No file"
    end
    uploaded_io = params[:id]

    CSV.foreach(uploaded_io.csvfile, :headers => true) do |row|
      puts row[1]
    #   if FamilyMember.where(:user_id => current_user.id, :first_name => row[0], last_name: row[1]).blank?
    #     puts "Data is not there"
    #   else
    #     puts "Data is there"
    #     client = FamilyMember.where(:first_name => row[0], :last_name => row[1])
    #     puts client
    #   end
    #   c = FamilyMember.new
    #   c.first_name = row[0]
    #   c.last_name = row[1]
    #   c.address = row[2]
    #   c.relationship = row[3]
    #   c.email = row[4]
    #   c.phone = row[5]
    #   c.user = current_user
    #   if c.save
    #     n = n + 1
    #     GC.start if n % 50 == 0
    #   end
    end
    #
    # flash[:success] = "CSV Import Successful,  #{n} new records added to data base"
    render json: @csv_file
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

  def export
    @csv_file = CsvUpload.find(params[:id])
    if @csv_file
      puts "called here"
    end
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

