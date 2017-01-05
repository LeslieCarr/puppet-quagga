#Class quagga::ospfd

class quagga::ospfd {

  unless $quagga::single_config_file == true {
    file { '/etc/quagga/ospfd.conf':
      mode    => '0644'.
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/ospfd.conf.erb'),
      notify  => Service['quagga'],
    }
  }
}
