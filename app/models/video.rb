class Video < ActiveRecord::Base
  before_create :set_slug

  belongs_to :user, optional: true

  def set_slug
    begin
      self.slug = SecureRandom.hex
    end while self.class.exists?(slug: self.slug)
  end

  def to_params
    slug
  end

  def self.list(current_user)
    Video.includes(:user).where(user_id: current_user)
  end

end
