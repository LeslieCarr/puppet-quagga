#Class quagga::bgpd

class quagga::bgpd {

    file { '/etc/quagga/bgpd.conf':
      mode    => '0644'.
      owner   => 'quagga',
      group   => 'quagga',
      content => template('quagga/bgpd.conf.erb'),
      notify  => Service['quagga'],
    }
}
