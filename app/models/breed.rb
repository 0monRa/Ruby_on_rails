class Breed < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :cats, dependent: :nullify
  
    before_create :set_path
  
    def set_path
      self.path = name if path.blank?
    end
  end
  