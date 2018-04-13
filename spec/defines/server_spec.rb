require 'spec_helper'

describe 'openvpn::server', type: :define do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let :pre_conditions do
        'class { "openvpn::servers": }'
      end
      let :title do
        'rspec-server'
      end
      let :params do
        {
          ca: '/tmp/ca.pem',
          cert: '/tmp/%{trusted.certname}.pem',
          server_conf_template: 'openvpn/server.erb',
          client_to_client: 'true',
          compression: 'comp-lzo',
          conf_dir: '/etc/openvpn',
          dev: 'tap',
          dh: '/etc/openvpn/dh1024.pem',
          float: 'false',
          key: '/tmp/%{trusted.certname}.key',
          name: 'rspec-server',
          persist_key: 'true',
          persist_tun: 'true',
          port: '1194',
          protocol: 'udp',
          server: '192.168.1.100',
          log_append: '/var/log',
          status: '/var/log/openvpn-status.log',
          status_version: '3',
          verbose: '3',
          writepid: '/var/run/openvpn.pid',
          openvpn_group: 'openvpn',
          openvpn_user: 'openvpn',
          ifconfig_pool_persist: 'ipp.txt',
          keepalive: '10 120',
        }
      end

      context 'with custom openvpn server' do
        it { is_expected.to contain_file('/etc/openvpn/rspec-server.conf').with('ensure' => 'present') }
      end
    end
  end
end
