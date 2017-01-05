#Class quagga::quagga
#
# For single config file deployments
#
# Supports zebra/bgpd for now

class quagga::quagga (
  $bgp_hostname          = $quagga::params::bgp_hostname,
  $bgp_password          = $quagga::params::bgp_password,
  $bgp_logfile           = $quagga::params::bgp_logfile,
  $bgp_as                = $quagga::params::bgp_as,
  $bgp_options           = $quagga::params::bgp_options,
  $bgp_networks          = $quagga::params::bgp_networks,
  $bgp_networks6         = $quagga::params::bgp_networks6,
  $bgp_neighbors         = $quagga::params::bgp_neighbors,
  $bgp_neighbor_groups   = $quagga::params::bgp_neighbor_groups,
  $bgp_accesslist        = $quagga::params::bgp_accesslist,
  $bgp_ip_prefix_list    = $quagga::params::bgp_ip_prefix_list,
  $bgp_route_maps        = $quagga::params::bgp_route_maps,
  $bgp_generic_options   = $quagga::params::bgp_generic_options,
  $zebra_password        = $quagga::params::zebra_password,
  $zebra_enable_password = $quagga::params::zebra_enable_password,
  $zebra_log_file        = $quagga::params::zebra_log_file,
  $zebra_ip6_routes      = $quagga::params::zebra_ip6_routes,
  $zebra_ip_routes       = $quagga::params::zebra_ip_routes,
  $zebra_interfaces      = $quagga::params::zebra_interfaces,
  $zebra_generic_options = $quagga::params::zebra_generic_options,
) {

  file { '/etc/quagga/Quagga.conf':
    mode    => '0644',
    owner   => 'quagga',
    group   => 'quagga',
    content => template('quagga/Quagga.conf.erb'),
    notify  => Service['quagga'],
  }
}
