#Class quagga::isisd

class quagga::isisd {

  unless $quagga::single_config_file == true {
    file { '/etc/quagga/isisd.conf':
      mode    => '0644'.
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/isisd.conf.erb'),
      notify  => Service['quagga'],
    }
  }
}
