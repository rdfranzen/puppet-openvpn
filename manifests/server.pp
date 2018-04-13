# openvpn::server
#
# Definitions of a server config file
#
# @summary
#
## Client Parameters
# @param [String] dh
# @param [String] ca
# @param [String] cert
# @param [String] key
# @param [String] crl-verify crl
# @param [String] client-to-client
# @param [String] server
# @param [String] port
# @param [String] proto
# @param [String] dev
# @param [String] persist-key
# @param [String] persist-tun
# @param [String] float
# @param [String] comp-lzo
# @param [String] log-append
# @param [String] status
# @param [String] status-version
# @param [String] verb
# @param [String] writepid
# @param [String] group
# @param [String] user
# @param [String] ifconfig-pool-persist
# @param [String] keepalive


define openvpn::server(
  $conf_dir              = $::openvpn::conf_dir,
  $dh                    = undef,
  $ca                    = undef,
  $cert                  = undef,
  $key                   = undef,
  $crl_verify            = undef,
  $client_to_client      = $::openvpn::server_client_to_client,
  $server                = undef,
  $port                  = $::openvpn::server_port,
  $protocol              = $::openvpn::server_protocol,
  $dev                   = $::openvpn::server_dev,
  $persist_key           = $::openvpn::server_persist_key,
  $persist_tun           = $::openvpn::server_persist_tun,
  $float                 = $::openvpn::server_float,
  $compression           = $::openvpn::server_compression,
  $log_append            = $::openvpn::server_log_append,
  $status                = $::openvpn::server_status,
  $status_version        = $::openvpn::server_status_version,
  $verbose               = $::openvpn::server_verbose,
  $writepid              = $::openvpn::server_writepid,
  $openvpn_group         = $::openvpn::server_openvpn_group,
  $openvpn_user          = $::openvpn::server_openvpn_user,
  $ifconfig_pool_persist = $::openvpn::server_ifconfig_pool_persist,
  $keepalive             = $::openvpn::server_keepalive,
  $server_conf_template  = $::openvpn::server_conf_template,
) {

  if !$server {
    fail("Openvpn::Server[${name}]: server must be defined")
  }

  file { "${conf_dir}/${name}.conf":
    ensure  => 'present',
    content => template($server_conf_template),
    group   => 'root',
    mode    => '0600',
    notify  => Class['openvpn::service'],
    owner   => 'root',
  }

}
