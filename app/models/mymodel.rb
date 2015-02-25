class Mymodel # < ActiveRecord::Base

  def publish_to_channel
    details = { 'checkin_time' => checkin_time,
                'status' => status }
    WebsocketRails[:special_channel].trigger(:new_message, details.to_json)
  end

  private
  def status
    %w(good bad ugly).sample
  end

  def checkin_time
    Time.zone.now.to_s
  end
end
