#Class quagga::bgpd

class quagga::bgpd (
  $bgp_hostname   = $quagga::params::bgp_hostname
  $bgp_password   = $quagga::params::bgp_password
  $bgp_logfile    = $quagga::params::bgp_logfile
  $bgp_as         = $quagga::params::bgp_as
  $bgp_comparemed = $quagga::params::bgp_comparemed
  $bgp_neighbors  = $quagga::params::bgp_neighbors
) {

  file { '/etc/quagga/bgpd.conf':
    mode    => '0644',
    owner   => 'quagga',
    group   => 'quagga',
    content => template('quagga/bgpd.conf.erb'),
    notify  => Service['quagga'],
  }
}
