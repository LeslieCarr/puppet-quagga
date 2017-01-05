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
class quagga (
  $manage_package     = $quagga::params::manage_package,
  $manage_service     = $quagga::params::manage_service,
  $single_config_file = $quagga::params::single_config_file,
  $zebra              = $quagga::params::zebra,
  $bgpd               = $quagga::params::bgpd,
  $ospfd              = $quagga::params::ospfd,
  $ospf6d             = $quagga::params::ospf6d,
  $ripd               = $quagga::params::ripd,
  $ripngd             = $quagga::params::ripngd,
  $isisd              = $quagga::params::isisd,
  $babeld             = $quagga::params::babeld,
) inherits quagga::params {
  if $manage_package {
    package { 'quagga':
      ensure   => present,
      before   => Service['quagga']
    }
  }

  if $manage_service {
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
  }

  if $single_config_file == false {
    if $zebra == true {
      include quagga::zebra
    }

    if $bgpd == true {
      include quagga::bgpd
    }

    if $ospfd == true {
      include quagga::ospfd
    }

    if $ospf6d == true {
      include quagga::ospf6d
    }

    if $ripd == true {
      include quagga::ripd
    }

    if $ripngd == true {
      include quagga::ripngd
    }

    if $isisd == true {
      include quagga::isisd
    }

    if $babeld == true {
      include quagga::babeld
    }
  }

  if $single_config_file == true {
    include quagga::quagga
  }
}
