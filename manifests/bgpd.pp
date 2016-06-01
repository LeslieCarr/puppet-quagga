#Class quagga::bgpd

class quagga::bgpd (
  $bgp_hostname        = $quagga::params::bgp_hostname,
  $bgp_password        = $quagga::params::bgp_password,
  $bgp_logfile         = $quagga::params::bgp_logfile,
  $bgp_as              = $quagga::params::bgp_as,
  $bgp_options         = $quagga::params::bgp_options,
  $bgp_networks        = $quagga::params::bgp_networks,
  $bgp_neighbors       = $quagga::params::bgp_neighbors,
  $bgp_neighbor_groups = $quagga::params::bgp_neighbor_groups,
  $bgp_accesslist      = $quagga::params::bgp_accesslist,
  $bgp_ip_prefix_list  = $quagga::params::bgp_ip_prefix_list,
  $bgp_route_maps      = $quagga::params::bgp_route_maps,
  $bgp_generic_options = $quagga::params::bgp_generic_options,
) {

  unless $single_config_file {
    file { '/etc/quagga/bgpd.conf':
      mode    => '0644',
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/bgpd.conf.erb'),
      notify  => Service['quagga'],
    }
  }
}
