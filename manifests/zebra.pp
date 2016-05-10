#quagga::zebra
class quagga::zebra (
  $zebra_password        = $quagga::params::zebra_password,
  $zebra_enable_password = $quagga::params::zebra_enable_password,
  $zebra_log_file        = $quagga::params::zebra_log_file,
) {
    file { '/etc/quagga/zebra.conf':
      mode    => '0644',
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/zebra.conf.erb'),
      notify  => Service['quagga'],
    }
}
