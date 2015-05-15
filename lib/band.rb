class Band < ActiveRecord::Base

  validates :name, presence: true
  has_and_belongs_to_many :venues
  before_save :name_normalizer

  private
    def name_normalizer
      self.name = name.downcase.titleize
    end
end
