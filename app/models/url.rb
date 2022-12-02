class Url < ApplicationRecord
  belongs_to :user
  has_many :visits, dependent: :delete_all

  validates :alias, presence: true, length: { maximum: 16 }
  validates :original_link, presence: true

  def self.generate_alias
    # Generate a unique alias
    generated_alias = SecureRandom.uuid[0..5]
    generate_alias if Url.find_by(alias: generated_alias)
    generated_alias
  end

  def self.check_alias(link)
    if Url.find_by(alias: link)
      false
    else
      true
    end
  end
end
