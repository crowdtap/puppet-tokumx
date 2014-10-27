# Internal: defaults
class tokumx::params {

  $ensure = present
  $host   = $::ipaddress_lo0
  $enable = true

  case $::operatingsystem {
    Darwin: {
      include boxen::config

      $configdir  = "${boxen::config::configdir}/tokumx"
      $datadir    = "${boxen::config::datadir}/tokumx"
      $executable = "${boxen::config::homebrewdir}/bin/mongod"
      $logdir     = "${boxen::config::logdir}/tokumx"
      $port       = 17017

      $package    = 'boxen/brews/tokumx'
      $version    = '2.0.0-boxen1'

      $service    = 'dev.tokumx'
    }

    Ubuntu: {
      $configdir  = '/etc/tokumx'
      $datadir    = '/data/db'
      $executable = undef # only used on Darwin
      $logdir     = '/var/log/tokumx'
      $port       = 27017

      $package    = 'tokumx'
      $version    = installed

      $service    = 'tokumx'
    }

    default: {
      fail('Unsupported OS!')
    }
  }
}
