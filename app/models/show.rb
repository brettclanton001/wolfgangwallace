class Show < ApplicationRecord

  def private?
    venue_address.blank?
  end
end
