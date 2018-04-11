# openvpn::clients
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#

class openvpn::clients (
  $clients = lookup('openvpn::client::connection')
) {

  contain '::openvpn'
  create_resources(openvpn::client, $clients)

}
