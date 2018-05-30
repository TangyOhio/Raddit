class Topic < ApplicationRecord
  belongs_to :sub
  has_many :comments, dependent: :destroy
end
