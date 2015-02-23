class ChatController < WebsocketRails::BaseController
  def new_message
    puts 'new_message: ' + message
    broadcast_message :new_message, 'Echo: ' + message
  end

  def blah_message
    puts 'blah message: ' + message
    #AnnounceWorker.perform_async(Time.zone.now.to_s)
    broadcast_message :new_message, 'Echo: ' + message
    self.send_time
  end

  def send_time
    time = { 'time' => Time.zone.now.to_s }
    WebsocketRails[:special_channel].trigger(:new_message, time.to_json )
    #broadcast_message :new_message,
  end
end
