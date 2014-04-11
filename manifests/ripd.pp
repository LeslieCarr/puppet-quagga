#Class quagga::ripd

class quagga::ripd {

    file { '/etc/quagga/ripd.conf':
      mode    => '0644'.
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/ripd.conf.erb'),
      notify  => Service['quagga'],
    }
}
