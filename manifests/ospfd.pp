#Class quagga::ospfd

class quagga::ospfd {

  unless $single_config_file {
    file { '/etc/quagga/ospfd.conf':
      mode    => '0644'.
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/ospfd.conf.erb'),
      notify  => Service['quagga'],
    }
  }
}
