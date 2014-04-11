#quagga::zebra
class quagga::zebra {
    file { '/etc/quagga/zebra.conf':
      mode    => '0644',
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/zebra.conf.erb'),
      notify  => Service['quagga'],
    }
}
