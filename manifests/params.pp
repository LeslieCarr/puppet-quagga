# Variables
# NOTE: uncertain whether or not to have configuration file or everything parameters
class quagga::params {

  $manage_package = true
  $manage_service = true
  # running zebra is highly recommended
  $zebra  = true
  $bgpd   = false
  $ospfd  = false
  $ospf6d = false
  $ripd   = false
  $ripngd = false
  $isisd  = false
  $babeld = false
  #do not publish password in public repositories
  $password = 'pass123'
  $router_id = $::network_lo

  #zebra variables
  $zebra_password = 'cn321'
  $zebra_enable_password = 'cn321'
  #BGP variables
  $bgp_hostname = 'bgpd'
  $bgp_password = 'cn321'
  $bgp_bgp_comparemed = false
  $bgp_as = '65001'
  $bgp_alwayscomparemed = false
  $bgp_logfile = '/var/log/quagga/bgpd.log'
  #$bgp_neighbors is an array in the format 
  # ISP1 => { 'neighbor_ip' => '192.0.2.1', 'neighbor_as' => '65001' }
  $bgp_neighbors = {
    neighbor1 => { 'neighbor_ip' => '192.0.2.1', 'neighbor_as' => '65001' },
  }

  #OSPF variables
  $ospf_logfile = '/var/log/quagga/ospfd.log'
  #$ospf_interfaces is an array in the format 
  $ospf_interfaces = {
    interface1 => { 'interface' => '192.0.2.1/24', 'area' => '0'},
  }

  #ospf6_interfaces is an array. By default assign it the same values as ospf_interfaces
  $ospf6_interfaces = $ospf_interfaces
}
