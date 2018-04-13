# openvpn::client
#
# Definitions of a client config file
#
# @summary ...
#
## Client Parameters
# @param [String] client_dev
# @param [String] client_protocol
# @param [String] client_port
# @param [String] client_persist_key
# @param [String] client_persist_tun
# @param [String] client_compression
# @param [String] client_mtu_test
# @param [String] client_fast_io
# @param [String] client_float
# @param [String] client_verbose
# @param [String] client_status_dir

define openvpn::client(
  $conf_dir             = $::openvpn::conf_dir,
  $dev                  = $::openvpn::client_dev,
  $protocol             = $::openvpn::client_protocol,
  $server               = undef,
  $port                 = $::openvpn::client_port,
  $resolv_retry         = undef,
  $bind                 = undef,
  $persist_key          = $::openvpn::client_persist_key,
  $persist_tun          = $::openvpn::client_persist_tun,
  $ca                   = undef,
  $cert                 = undef,
  $key                  = undef,
  $ns_cert_type         = undef,
  $cipher               = undef,
  $compression          = $::openvpn::client_compression,
  $mtu_test             = $::openvpn::client_mtu_test,
  $fast_io              = $::openvpn::client_fast_io,
  $float                = $::openvpn::client_float,
  $verbose              = $::openvpn::client_verbose,
  $status_dir           = $::openvpn::client_status_dir,
  $client_conf_template = $::openvpn::client_conf_template,
) {

  if !$server {
    fail("Openvpn::Client[${name}]: server must be defined")
  }

  file { "${conf_dir}/${name}.conf":
    ensure  => 'present',
    content => template($client_conf_template),
    group   => 'root',
    mode    => '0600',
    notify  => Class['openvpn::service'],
    owner   => 'root',
  }

}
