class Request < ActiveRecord::Base
  belongs_to :trap

  def title
    "##{self.id} #{self.created_at.strftime('%H:%M:%S %e.%m.%Y ')}"
  end

  def json_body
    begin
      JSON.parse(self.body)
    rescue
      {}
    end
  end
end
