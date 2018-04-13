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
  $server_conf_template         = 'openvpn/server.erb',
  $client_conf_template         = 'openvpn/client.erb',

  ## Package Configuration
  $package_ensure               = present,
  $package_name                 = $openvpn::package_name,

  ## Service Configuration
  $service_enable               = true,
  $service_ensure               = running,
  $service_name                 = $openvpn::service_name,

  ## Configuration files
  $conf_dir                     = $openvpn::conf_dir,

  ## Server configuration
  $server_client_to_client      = $openvpn::server_client_to_client,
  $server_port                  = $openvpn::server_port,
  $server_protocol              = $openvpn::server_protocol,
  $server_dev                   = $openvpn::server_dev,
  $server_persist_key           = $openvpn::server_persist_key,
  $server_persist_tun           = $openvpn::server_persist_tun,
  $server_float                 = $openvpn::server_float,
  $server_compression           = $openvpn::server_compression,
  $server_log_append            = $openvpn::server_log_append,
  $server_status                = $openvpn::server_status,
  $server_status_version        = $openvpn::server_version,
  $server_verbose               = $openvpn::server_verbose,
  $server_writepid              = $openvpn::server_writepid,
  $server_openvpn_group         = $openvpn::server_group,
  $server_openvpn_user          = $openvpn::server_user,
  $server_ifconfig_pool_persist = $openvpn::server_ifconfig_pool_persist,
  $server_keepalive             = $openvpn::server_keepalive,

  ## Client Configuration
  $client_dev                   = $openvpn::client_dev,
  $client_protocol              = $openvpn::client_protocol,
  $client_port                  = $openvpn::client_port,
  $client_persist_key           = $openvpn::client_persist_key,
  $client_persist_tun           = $openvpn::client_persist_tun,
  $client_compression           = $openvpn::client_compression,
  $client_mtu_test              = $openvpn::client_mtu_test,
  $client_fast_io               = $openvpn::client_fast_io,
  $client_float                 = $openvpn::client_float,
  $client_verbose               = $openvpn::client_verbose,
  $client_status_dir            = $openvpn::client_status_dir,

) {

  contain '::openvpn::install'
  contain '::openvpn::service'

  Class['openvpn::install']
  -> Class['openvpn::service']

}
