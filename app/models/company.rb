class Company < ActiveRecord::Base
  attr_accessible :name, :user_id, :edit_token, :view_token

  belongs_to :user
  has_many :drinks
  belongs_to :currently_making, :class_name => :drink
  before_create :generate_tokens

  scope :find_by_token, lambda {|token| where("view_token = ? OR edit_token = ?", token, token) }

  private

  def generate_tokens
    self.view_token = generate_token
    self.edit_token = generate_token
  end

  def generate_token
    token = Company.random_token
    token = Company.random_token while Company.has_token?(token)
    token
  end

  def self.has_token?(token)
    Company.find_by_token(token).count > 0
  end

  def self.random_token
    SecureRandom.urlsafe_base64(6)
  end

end
