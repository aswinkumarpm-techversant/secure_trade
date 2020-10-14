class UploadsController < ApplicationController
  def index
  end

  def create
    n = 0
    rowarray = Array.new
    if params[:file]
      puts "File is There"
    else
      puts "No file"
    end
    uploaded_io = params[:file]

    CSV.foreach(uploaded_io.path, :headers => true) do |row|
      puts row[1]
      if FamilyMember.where(:user_id => current_user.id, :first_name => row[0], last_name: row[1]).blank?
        puts "Data is not there"
      else
        puts "Data is there"
        client = FamilyMember.where(:first_name => row[0], :last_name => row[1])
        puts client
      end
      c = FamilyMember.new
      c.first_name = row[0]
      c.last_name = row[1]
      c.address = row[2]
      c.relationship = row[3]
      c.email = row[4]
      c.phone = row[5]
      c.user = current_user
      if c.save
        n = n + 1
        GC.start if n % 50 == 0
      end
    end

    flash[:success] = "CSV Import Successful,  #{n} new records added to data base"

    redirect_to family_members_path

  end
end
