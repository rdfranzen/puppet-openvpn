require 'spec_helper'
describe 'openvpn' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('openvpn') }
      it { is_expected.to contain_class('openvpn::install').that_comes_before('Class[openvpn::service]') }
      it { is_expected.to contain_class('openvpn::service') }

      context 'openvpn::install' do
        it { is_expected.to contain_package('openvpn') }
      end

      context 'openvpn::service' do
        it { is_expected.to contain_service('openvpn').with('ensure' => 'running', 'enable' => true) }
      end
    end
  end
end
