# == Schema Information
#
# Table name: shortened_urls
#
#  id        :integer          not null, primary key
#  long_url  :string
#  short_url :string
#  user_id   :integer
#

require "SecureRandom"

class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :presence => true, :uniqueness => true
  validates :short_url, :uniqueness => true

  belongs_to(
    :authors,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )


  def self.random_code
    random = SecureRandom.urlsafe_base64
    until !ShortenedUrl.exists?(:short_url => random)
      random = SecureRandom.urlsafe_base64
    end
    random
  end

  def self.create_for_user_and_long_url!(user_id, long_url)
    ShortenedUrl.create!(short_url: self.random_code, long_url: long_url, user_id:user_id)
  end

  def num_clicks
    select(user_id).distinct
  end

end
