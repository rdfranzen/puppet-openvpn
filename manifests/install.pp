# openvpn::install
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include openvpn::install
class openvpn::install (
  $package_name   = $::openvpn::package_name,
  $package_ensure = $::openvpn::package_ensure,
) {

  package { $package_name:
    ensure => $package_ensure,
  }

}
