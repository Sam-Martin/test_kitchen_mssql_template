require 'serverspec'
require 'json'

describe 'sql server' do
  let(:node) do
    JSON.parse(
      IO.read(File.join(ENV['TEMP'] || '/tmp', 'kitchen/nodes/default-windows-mssqlserver.json'))
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
  
  it 'has an non localhost ip' do
    expect(ip).not_to eq('127.0.0.1')
  end

  it 'has a valid ip' do
    expect(ip).to match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)
  end

  it 'connects successfully' do
  	expect(connection.active?).to be true
  end
end