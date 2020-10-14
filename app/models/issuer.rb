class Issuer < ApplicationRecord
  has_many :security_types, dependent: :destroy
  has_many :securities, dependent: :destroy
  validates :name, presence: true,
            length: { minimum: 5 }
end
