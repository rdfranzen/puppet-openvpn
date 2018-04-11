require 'spec_helper_acceptance'

describe 'openvpn class' do
  context 'should work with no errors' do
    it 'when configuring openvpn without parameters' do
      pp = <<-EOS
        class { 'openvpn': }
      EOS

      apply_manifest(pp, catch_failures: true) do |r|
        expect(r.stderr).not_to %r{match(/error/i)}
        expect(r.exit_code).to %r{eq(2)}
      end

      apply_manifest(pp, catch_failures: true) do |r|
        expect(r.stderr).not_to %r{eq(/error/i)}
        expect(r.exit_code).to be_zero
      end
    end
    describe package('openvpn') do
      it { is_expected.to be_installed }
    end

    describe service('openvpn') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end
  end
end
