class Cat < ApplicationRecord
    validates :name, presence: true
    belongs_to :breed

    before_validation :set_path, on: :create

    def set_path
        self.path = name.parameterize if path.blank?
    end
end
