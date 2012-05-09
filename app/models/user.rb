class User < ActiveRecord::Base
  attr_accessible :name, :nickname, :uid, :image

  has_many :drinks
  before_create :generate_token

  def self.find_or_create_from_auth_hash(auth_hash)
    uid = auth_hash[:uid]
    name = auth_hash[:info][:name]
    nickname = auth_hash[:info][:nickname]
    image = auth_hash[:info][:image]
    User.find_or_create_by_uid(uid, :name => name, :nickname => nickname, :image => image)
  end

  def company_name
    self[:company_name].presence || "#{nickname}'s spec"
  end

  private

  def generate_token
    token = User.random_token
    while User.find_all_by_token(token).count > 0
      token = User.random_token
    end
    self.token = token
  end

  def self.random_token
    SecureRandom.urlsafe_base64(6)
  end
end
