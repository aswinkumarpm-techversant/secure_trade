class CsvUploadJob < ApplicationJob
  queue_as :default
  include(Api::V1::CsvUploadsHelper)
  def perform(path)
    puts path
    export(path)
  end
end
