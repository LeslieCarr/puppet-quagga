# Variables
# NOTE: uncertain whether or not to have configuration file or everything parameters
class quagga::params {

  $manage_package = true
  $manage_service = true
  # Cumulus Linux defaults to use a single config file, Quagga.conf
  $single_config_file = false
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
  $zebra_log_file = '/var/log/quagga/zebra.log'
  #$zebra_ip-routes is an array of routes, ie
  # quagga::zebra:bgp_ip-route => [ '0.0.0.0/0 192.168.0.1', '10.0.0.0/24 10.0.0.1', ],
  $zebra_ip_routes = undef
  $zebra_ip6_routes = undef
  #$zebra_interfaces is a hash of arrays with interface parameters
  $zebra_interfaces = undef
  #$zebra_generic_options is an array of generic options for bgpd, ie
  # quagga::zebra::zebra_generic_options => { 'ip' => 'forwarding', 'ipv6' => 'forwarding' }
  $zebra_generic_options = undef

  #BGP variables
  $bgp_hostname = 'bgpd'
  $bgp_password = 'cn321'
  $bgp_as = '65001'
  $bgp_logfile = '/var/log/quagga/bgpd.log'
  #$bgp_networks is an array of bgp networks, ie
  # quagga::bgpd::bgp_networks => [ '0.0.0.0/0', '192.168.0.0/24', ],
  $bgp_networks = undef
  $bgp_networks6 = undef
  #$bgp_options is an array of bgp options, ie
  # quagga::bgpd::bgp_options => [ 'log-neighbor-changes', 'router-id 192.168.0.1', ],
  $bgp_options = undef
  #$bgp_neighbor_group is a hash of arrays with group names and options, ie
  # quagga::bgpd::bgp_neighbor_groups => { 'name-of-group': options => [ 'peer-group', 'remote-as 65535', ], members => [ '192.168.0.10', '192.168.0.11', ], }
  $bgp_neighbor_groups = undef
  #$bgp_neighbors is an array of of neighbor comands
  $bgp_neighbors = undef
  #$bgp_accesslists is a hash of arrays with list names and rules, ie
  # quagga::bgpd::bgp_accesslists => { '10' => [ 'permit 10.0.0.0 0.0.0.255', 'permit 192.168.0.0 0.0.255.255', ], }
  $bgp_accesslist = undef
  #$bgp_ip_prefix is an array of ip prefixes, ie
  # quagga::bgpd::bgp_ip_prefix_list => [ 'routes-from-external seq 5 deny any', 'routes-to-external seq 5 permit 0.0.0.0/0', ],
  $bgp_ip_prefix_list = undef
  #$bgp_route_maps is a hash of arrays with route-maps with options, ie
  # quagga::bgpd::bgp_route_maps => { 'ADVERTS permit 5' => [ 'match ip address prefix-list routes-from-external ', ' set as-path prepend 123 123', ], }
  $bgp_route_maps = undef
  #$bgp_generic_options is a hash of generic options for bgpd
  $bgp_generic_options = undef
  
  #OSPF variables
  $ospf_logfile = '/var/log/quagga/ospfd.log'
  #$ospf_interfaces is an array in the format 
  $ospf_interfaces = {
    interface1 => { 'interface' => '192.0.2.1/24', 'area' => '0'},
  }

  #ospf6_interfaces is an array. By default assign it the same values as ospf_interfaces
  $ospf6_interfaces = $ospf_interfaces
}
