#Class quagga::ripd

class quagga::ripd {

  unless $quagga::single_config_file == true {
    file { '/etc/quagga/ripd.conf':
      mode    => '0644'.
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/ripd.conf.erb'),
      notify  => Service['quagga'],
    }
  }
}
