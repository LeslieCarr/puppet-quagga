# Variables 
# NOTE: uncertain whether or not to have configuration file or everything parameters
class quagga::configuration {

  $router_id = "$::network_lo"
  $AS = ''
  #$bgp_interfaces should be a list
  $bgp_interfaces = ''
  #$ospf_interfaces should be a list
  $ospf_interfaces = ''
  #$ospf_area should be in dotted quad format
  $ospf_area = '0.0.0.0'
}
