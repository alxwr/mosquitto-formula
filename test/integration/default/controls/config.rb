# frozen_string_literal: true

control 'mosquitto.config.file' do
  title 'Verify the configuration file'

  describe file('/etc/mosquitto/mosquitto.conf') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0644' }
    its('content') { should include('# File managed by Salt at') }
    its('content') { should include('log_dest syslog') }
    its('content') { should include('persistence true') }
  end
end
