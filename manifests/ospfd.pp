#Class quagga::ospfd

class quagga::ospfd {

    file { '/etc/quagga/ospfd.conf':
      mode    => '0644',
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/ospfd.conf.erb'),
      notify  => Service['quagga'],
    }
}
