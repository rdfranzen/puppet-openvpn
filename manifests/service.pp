# openvpn::service
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include openvpn::service
class openvpn::service (
  $service_enable = $::openvpn::service_enable,
  $service_ensure = $::openvpn::service_ensure,
  $service_name   = $::openvpn::service_name,
) {

  service { $service_name:
    ensure  => $service_ensure,
    enable  => $service_enable,
    require => Class['openvpn::install'],
  }

}
