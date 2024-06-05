class Cat < ApplicationRecord
    belongs_to :user
    belongs_to :breed
  
    validates :name, presence: true
    validates :breed_id, presence: true
    validates :user_id, presence: true
  
    before_validation :set_path, on: :create
  
    def set_path
      self.path = name.parameterize if path.blank?
    end
  end
  