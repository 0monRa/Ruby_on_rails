class Cat < ApplicationRecord
    validates :name, presence: true

    belongs_to :country

    before_create :set_path

    def set_path
        unless path
            self.path = name
        end
    end
end