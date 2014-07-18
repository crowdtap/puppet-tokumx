# Internal: Manage tokumx service
class tokumx::service(
  $ensure  = $tokumx::params::ensure,

  $service = $tokumx::params::service,
  $enable  = $tokumx::params::enable,
) inherits tokumx::params {

  $svc_ensure = $ensure ? {
    present => running,
    default => stopped,
  }

  if $::operatingsystem == 'Darwin' {
    service { 'com.boxen.tokumx': # replaced by dev.tokumx
      ensure => stopped,
      before => Service[$service],
      enable => false,
    }
  }

  service { $service:
    ensure => $svc_ensure,
    enable => $enable,
    alias  => 'tokumx',
  }

}
