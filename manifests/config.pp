# Internal: Configuration files
class tokumx::config(
  $ensure     = $tokumx::params::ensure,

  $executable = $tokumx::params::executable,

  $configdir  = $tokumx::params::configdir,
  $datadir    = $tokumx::params::datadir,
  $logdir     = $tokumx::params::logdir,

  $host       = $tokumx::params::host,
  $port       = $tokumx::params::port,

  $service    = $tokumx::params::service,
) inherits tokumx::params {

  $dir_ensure = $ensure ? {
    present => directory,
    default => absent,
  }

  file {
    [
      $configdir,
      $datadir,
      $logdir,
    ]:
      ensure  => $dir_ensure;

    "${configdir}/tokumx.conf":
      ensure  => $ensure,
      content => template('tokumx/tokumx.conf.erb') ;
  }

  if $::operatingsystem == 'Darwin' {
    include boxen::config

    file {
      "${boxen::config::envdir}/tokumx.sh":
        ensure  => absent ;

      "/Library/LaunchDaemons/${service}.plist":
        ensure  => $ensure,
        content => template('tokumx/dev.tokumx.plist.erb'),
        group   => 'wheel',
        owner   => 'root' ;
    }

    boxen::env_script { 'tokumx':
      ensure   => $ensure,
      content  => template('tokumx/env.sh.erb'),
      priority => 'lower',
    }
  }
}
