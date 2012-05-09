class User < ActiveRecord::Base
  attr_accessible :name, :nickname, :uid, :image

  has_many :drinks

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
end
