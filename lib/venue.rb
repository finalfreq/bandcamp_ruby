class Venue < ActiveRecord::Base

  has_and_belongs_to_many :bands
  before_save :name_normalizer

  private
    def name_normalizer
      self.name = name.downcase.titleize

    end
end
