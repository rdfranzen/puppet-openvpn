require 'spec_helper'

describe 'openvpn::client', type: :define do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let :pre_conditions do
        'class { "openvpn::clients": }'
      end
      let :title do
        'rspec'
      end
      let :params do
        {
          bind: 'nobind',
          ca: '/tmp/ca.pem',
          cert: '/tmp/%{trusted.certname}.pem',
          client_conf_template: 'openvpn/client.erb',
          compression: 'comp-lzo',
          conf_dir: '/etc/openvpn',
          dev: 'tap',
          fast_io: 'false',
          float: 'false',
          key: '/tmp/%{trusted.certname}.key',
          mtu_test: 'false',
          name: 'rspec',
          persist_key: 'true',
          persist_tun: 'true',
          port: '1194',
          protocol: 'udp',
          resolv_retry: 'infinite',
          server: '192.168.1.100',
          status_dir: '/var/log',
          verbose: '3',
        }
      end

      context 'with custom openvpn client' do
        it { is_expected.to contain_file('/etc/openvpn/rspec.conf').with('ensure' => 'present') }
      end
    end
  end
end
