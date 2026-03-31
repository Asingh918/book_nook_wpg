class Page < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true
  validates :content, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "slug", "title", "content", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
