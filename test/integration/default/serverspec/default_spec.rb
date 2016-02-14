require 'serverspec'
require 'json'

describe 'sql server' do
  let(:node) do
    JSON.parse(
      IO.read(File.join(ENV['TEMP'] || '/tmp', 'kitchen/default-windows-mssqlserver.json'))
    )
  end
  let(:ip) { node['automatic']['ipaddress'] }
  let(:connection) do
    require 'tiny_tds'
	  ::TinyTds::Client.new(
  	  :username => 'sa',
  	  :password => 'Vagrant!',
  	  :host => ip
  	)
  end

  it 'connects successfully' do
  	expect(connection.active?).to be true
  end
end