class Material < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
