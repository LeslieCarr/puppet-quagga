#=== Class: quagga
# Description TBD
# Parameters - tbd
#
# === Examples
# TBD (see a pattern?)
#
# === Authors
# Leslie Carr <leslie@cumulusnetworks.com>
#
# === License
# Apache v2
class quagga
{
  package { 'quagga':
    ensure   => present,
    before   => Service['quagga']
  }

  service { 'quagga':
    ensure      => running,
    hasrestart  => true,
    hasstatus   => false,
    enable      => true,
  }

  file { '/etc/quagga/daemons':
    mode    => '0644',
    owner   => 'quagga',
    group   => 'quagga',
    content => template('quagga/daemons.erb'),
    notify  => Service['quagga'],
  }

  file { '/etc/quagga/vtysh.conf':
    mode    => '0644',
    owner   => 'quagga',
    group   => 'quagga',
    content => template('quagga/vtysh.conf.erb'),
    notify  => Service['quagga'],
  }

  if $quagga::params::zebra == true {
    include quagga::zebra
  }

  if $quagga::params::bgpd == true {
    include quagga::bgpd
  }

  if $quagga::params::ospfd == true {
    include quagga::ospfd
  }

  if $quagga::params::ospf6d == true {
    include quagga::ospf6d
  }

  if $quagga::params::ripd == true {
    include quagga::ripd
  }

  if $quagga::params::ripngd == true {
    include quagga::ripngd
  }

  if $quagga::params::isisd == true {
    include quagga::isisd
  }

  if $quagga::params::babeld == true {
    include quagga::babeld
  }

}
