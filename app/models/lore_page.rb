class LorePage < ApplicationRecord
  validates :slug,
    presence: true,
    length: {
      maximum: 50
    },
    uniqueness: true,
    format: {
      with: /\A(?!\d+\z)[^\s!#$%^&*()（）=+;:'"\[\]\{\}|\\\/<>?,]+\z/,
      message: 'contains invalid characters'
    }
  validates :name, presence: true
  validates :body, presence: true
  validates :position, presence: true
end
