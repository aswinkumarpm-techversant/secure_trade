class InterestFrequency < ApplicationRecord
  has_many :securities, dependent: :destroy
end
