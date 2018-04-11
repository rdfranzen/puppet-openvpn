
# OpenVPN

Welcome to your new module. A short overview of the generated parts can be found in the PDK documentation at https://puppet.com/pdk/latest/pdk_generating_modules.html .

The README template below provides a starting point with details about what information to include in your README.







#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with openvpn](#setup)
    * [What openvpn affects](#what-openvpn-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with openvpn](#beginning-with-openvpn)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

...

## Setup

### What openvpn affects **OPTIONAL**

...

### Setup Requirements **OPTIONAL**

...

### Beginning with openvpn

...

## Usage

...

### Hiera Example
#### Client
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
