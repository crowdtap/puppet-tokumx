# Public: Install tokumx.
#
# Examples
#
#   include tokumx
class tokumx(
  $ensure     = $tokumx::params::ensure,

  $executable = $tokumx::params::executable,

  $configdir  = $tokumx::params::configdir,
  $datadir    = $tokumx::params::datadir,
  $logdir     = $tokumx::params::logdir,

  $host       = $tokumx::params::host,
  $port       = $tokumx::params::port,

  $package    = $tokumx::params::package,
  $version    = $tokumx::params::version,

  $service    = $tokumx::params::service,
  $enable     = $tokumx::params::enable,
) inherits tokumx::params {

  class { 'tokumx::config':
    ensure     => $ensure,

    executable => $executable,

    configdir  => $configdir,
    datadir    => $datadir,
    logdir     => $logdir,

    host       => $host,
    port       => $port,

    service    => $service,

    notify     => Service['tokumx'],
  }

  ~>
  class { 'tokumx::package':
    ensure  => $ensure,

    package => $package,
    version => $version,
  }

  ~>
  class { 'tokumx::service':
    ensure  => $ensure,

    service => $service,
    enable  => $enable,
  }
}
