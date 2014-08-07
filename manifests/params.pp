# Variables
# NOTE: uncertain whether or not to have configuration file or everything parameters
class quagga::params {
  $bgp_alwayscomparemed = false
#  $bgp_logfile = '/var/log/quagga/bgpd.log'

  #OSPF variables
  $ospf_logfile = '/var/log/quagga/ospfd.log'
  #$ospf_interfaces is an array in the format 
  $ospf_interfaces = {
    interface1 => { 'interface' => '', 'area' => ''},
  }

  #ospf6_interfaces is an array. By default assign it the same values as ospf_interfaces
  $ospf6_interfaces = $ospf_interfaces
}
