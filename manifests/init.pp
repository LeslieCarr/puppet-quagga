# === Class: quagga
# Description TBD
# Parameters - tbd
#
# === Examples
# TBD (see a pattern?)
#
# === Authors
# Leslie Carr <geekgirl@gmail.com>
#
# === License
# GPL v3
class quagga(
$zebra  = false,
$bgpd   = false,
$ospfd  = false,
$ospf6d = false,
$ripd   = false,
$ripngd = false,
$isisd  = false,
$babeld = false)
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

  if $zebra == 'true' {
    file { '/etc/quagga/zebra.conf':
      mode    => '0644',
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/zebra.conf.erb'),
      notify  => Service['quagga'],
    }
  if $bgpd == 'true' {
    file { '/etc/quagga/bgpd.conf':
      mode    => '0644'.
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/bgpd.conf/erb'),
      notify  => Service['quagga'],
    }
  }
}
