#Class quagga::ospf6d

class quagga::ospf6d {

    file { '/etc/quagga/ospf6d.conf':
      mode    => '0644'.
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/ospf6d.conf.erb'),
      notify  => Service['quagga'],
    }
}
