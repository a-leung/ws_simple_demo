describe 'ChatController' do
  context 'blah' do
    it '' do
      puts 'blah'
      expect(create_event('new_message', 'nil').dispatch).to_not be_nil
      expect(create_event('new_message', 'nil').dispatch).to trigger_success_message
    end
  end
end
