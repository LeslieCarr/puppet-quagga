#Class quagga::ripngd

class quagga::ripngd {

  unless $quagga::single_config_file == true {
    file { '/etc/quagga/ripngd.conf':
      mode    => '0644'.
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/ripngd.conf.erb'),
      notify  => Service['quagga'],
    }
  }
}
