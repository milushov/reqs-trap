require 'digest/md5'

class Trap < ActiveRecord::Base
  has_many :requests, -> { order(created_at: :desc) }

  before_save :set_secure_id

  default_scope { order(created_at: :desc) }

  def to_param
    secure_id
  end

  private

  def set_secure_id
    salt = "super-salt-#{rand(1e10)}"
    sid = Digest::MD5.hexdigest([salt, Time.now].join)[0..6]
    self.secure_id = [self.secure_id, sid].join('-')
  end
end
