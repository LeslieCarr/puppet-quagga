#quagga::zebra
class quagga::zebra (
  $zebra_password        = $quagga::params::zebra_password,
  $zebra_enable_password = $quagga::params::zebra_enable_password,
  $zebra_log_file        = $quagga::params::zebra_log_file,
  $zebra_ip6_routes      = $quagga::params::zebra_ip6_routes,
  $zebra_ip_routes       = $quagga::params::zebra_ip_routes,
  $zebra_interfaces      = $quagga::params::zebra_interfaces,
  $zebra_generic_options = $quagga::params::zebra_generic_options,
) {

  unless $single_config_file == true {
    file { '/etc/quagga/zebra.conf':
      mode    => '0644',
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/zebra.conf.erb'),
      notify  => Service['quagga'],
    }
  }
}
