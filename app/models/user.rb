# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :email, :presence => true

  has_many(
    :short_urls,
    class_name: "ShortenedUrl",
    foreign_key: :user_id,
    primary_key: :id
  )
end
