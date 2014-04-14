# Variables
# NOTE: uncertain whether or not to have configuration file or everything parameters
class quagga::params {

  # running zebra is highly recommended
  $zebra  = true,
  $bgpd   = false,
  $ospfd  = false,
  $ospf6d = false,
  $ripd   = false,
  $ripngd = false,
  $isisd  = false,
  $babeld = false
  #do not publish password in public repositories
  $password = ''
  $router_id = $::network_lo

  #BGP variables
  $AS = ''
  $bgp_alwayscomparemed = false
  $bgp_logfile = '/var/log/quagga/bgpd.log'
  #$bgp_neighbors is an array in the format 
  # ISP1 => { 'neighbor_ip' => '192.0.2.1', 'neighbor_as' => '65001' }
  $bgp_neighbors = {
    neighbor1 => { 'neighbor_ip' => '', 'neighbor_as' => '' },
  }

  #OSPF variables
  $ospf_logfile = '/var/log/quagga/ospfd.log'
  #$ospf_interfaces is an array in the format 
  $ospf_interfaces = {
    interface1 => { 'interface' => '', 'area' => ''},
  }

  #ospf6_interfaces is an array. By default assign it the same values as ospf_interfaces
  $ospf6_interfaces = $ospf_interfaces
}
