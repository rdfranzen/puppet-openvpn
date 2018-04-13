# openvpn::servers
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#

class openvpn::servers (
  $servers = lookup('openvpn::server::instance')
) {

  contain '::openvpn'
  create_resources(openvpn::server, $servers)

}
