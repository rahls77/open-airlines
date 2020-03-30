class Airline < ApplicationRecord
  has_many :reviews

  before_create :slugify

  def slugify
    self.slug = name.parameterize
  end

  def average_score
    return 0 unless reviews.size.positive?
    (reviews.sum(:score).to_f / reviews.count.to_f).to_f
  end
end
