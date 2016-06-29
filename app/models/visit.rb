# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  visitor_id :integer
#  short_url  :string
#

class Visit < ActiveRecord::Base
  validates :visitor_id, :presence => true
  validates :short_url, :presence => true

  belongs_to(
    :visitor,
    class_name: "User",
    foreign_key: :visitor_id,
    primary_key: :id
  )

  belongs_to(
    :short_url,
    class_name: "ShortenedUrl",
    foreign_key: :short_url,
    primary_key: :short_url
  )

end
