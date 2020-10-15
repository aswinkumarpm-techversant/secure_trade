class CsvUploadJob < ApplicationJob
  include CSVUpload
  queue_as :default
  def perform(path)

    puts path
    export(path)
  end
end
