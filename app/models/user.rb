# frozen_string_literal: true

class User < ActiveRecord::Base
  before_create :set_slug

  has_many :videos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  def set_slug
    begin
      self.slug = SecureRandom.hex
    end while self.class.exists?(slug: self.slug)
  end

  def to_params
    slug
  end

end
