# openvpn
#
# This is a class to install and manage OpenVPN
#
# @example Declaring the class
#   include openvpn
#
## Template parameters
# @param [String] client_conf_template Client config file template
#
## Package Parameters
# @param [String] package_ensure Ensure if package is installed or not
# @param [String] package_name Name of package
#
## Service Parameters
# @param [String] service_enable Enable or disable service
# @param [String] service_ensure Ensure if service is running
# @param [String] service_name Service Name
#
## Config directory
# @param [String] conf_dir Configuration directory

class openvpn (

  ## Templates
  $client_conf_template = 'openvpn/client.erb',

  ## Package Configuration
  $package_ensure       = present,
  $package_name         = $openvpn::package_name,

  ## Service Configuration
  $service_enable       = true,
  $service_ensure       = running,
  $service_name         = $openvpn::service_name,

  ## Configuration files
  $conf_dir             = $openvpn::conf_dir,

  ## Client Configuration
  $client_dev           = $openvpn::client_dev,
  $client_protocol      = $openvpn::client_protocol,
  $client_port          = $openvpn::client_port,
  $client_persist_key   = $openvpn::client_persist_key,
  $client_persist_tun   = $openvpn::client_persist_tun,
  $client_compression   = $openvpn::client_compression,
  $client_mtu_test      = $openvpn::client_mtu_test,
  $client_fast_io       = $openvpn::client_fast_io,
  $client_float         = $openvpn::client_float,
  $client_verbose       = $openvpn::client_verbose,
  $client_status_dir    = $openvpn::client_status_dir,

) {

  contain '::openvpn::install'
  contain '::openvpn::service'

  Class['openvpn::install']
  -> Class['openvpn::service']

}
