
# OpenVPN


#### Table of Contents

1. [Overview](#overview)
2. [Supported Platforms](#supported-platforms)
3. [Installation](#installation)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Author/Contributors](#author-contributors)

## Overview

This module will install the latest OpenVPN in your system.

This module can also manage one or many server or client configuration files.

I'ts a very simple module. Still can't manage key files or generate new certificates.


## Supported Platforms

This module was tested under these platforms:
 * Debian 8, 9
 * Ubuntu 16.04

This module use Hiera, so it's easy to add new platforms.

## Installation

via git
```
# cd /etc/puppetlabs/code/environment/<environment>/modules
# git clone https://github.com/rdfranzen/puppet-openvpn openvpn
```

via puppet
```
puppet module install rfranzen/openvpn
```

via puppetfile
```
mod 'rfranzen-openvpn'
```


## Usage

Only install OpenVPN
```
class { 'openvpn::install': }
```



### Server

```
class { 'openvpn::install': }

openvpn::server { 'server-1':
  dh                    => undef,
  ca                    => undef,
  cert                  => undef,
  key                   => undef,
  client_to_client      => false,
  server                => '192.168.1.5',
  port                  => '1194',
  protocol              => 'udp',
  dev                   => 'tap',
  persist_key           => true,
  persist_tun           => true,
  compression           => 'comp-lzo',
  log_append            => '/var/log/openvpn',
  status                => '/var/log/openvpn/openvpn-status.log',
  status_version        => '3',
  verbose               => '3',
  writepid              => '/var/run/openvpn.pid',
  openvpn_group         => 'openvpn',
  openvpn_user          => 'openvpn',
  ifconfig_pool_persist => 'ipp.txt',
  keepalive             => '10 120',
}
```


#### Hiera example

Definition file:
```
class { 'openvpn::clients' }
```


yaml file:
```
openvpn::server::instance:
  lab-server:
    dev: tap
    protocol: udp
    port: 1194
    server: 192.168.1.5
    dh: /etc/openvpn/dh1024.pem
    ca: /etc/openvpn/certs/ca.pem
    cert: /etc/openvpn/my-conn.pem
    key: /etc/openvpn/keys/my-conn.pem
    crl_verify: /var/lib/puppet/ssl/crl.pem
    client_to_client: false
```

### Client

```
class { 'openvpn::install': }

openvpn::client { 'client-1':
  dev          => 'tap',
  protocol     => 'udp',
  server       => '192.168.0.100',
  port         => '1194',
  persist_key  => true,
  persist_tun  => true,
  ca           => '/etc/openvpn/keys/my-ca.ca',
  cert         => '/etc/openvpn/keys/my-cert.ca',
  key          => '/etc/openvpn/keys/my-key.key',
  ns_cert_type => 'server',
  compression  => 'comp-lzo',
  verbose      => '3',
  status_dir   => '/var/log/openvpn',
}
```

#### Hiera example

Yaml
```
openvpn::client::connection:
  my-conn:
    dev: tap
    protocol: udp
    port: 1194
    server: 192.168.1.100
    resolv_retry: infinite
    bind: nobind
    persist_key: true
    persist_tun: true
    mtu_test: false
    fast_io: false
    float: false
    ca: '/etc/openvpn/certs/ca.pem'
    cert: '/etc/openvpn/certs/my-conn.pem'
    key: '/etc/openvpn/keys/my-conn.pem'
```


## Author / Contributors
Ricardo Franzen (rfranzen at gmail dot com)