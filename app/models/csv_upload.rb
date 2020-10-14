class CsvUpload < ApplicationRecord
  mount_uploader :csvfile, CsvfileUploader
end
