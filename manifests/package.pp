# Internal: install tokumx package
class tokumx::package(
  $ensure  = $tokumx::params::ensure,

  $package = $tokumx::params::package,
  $version = $tokumx::params::version,
) inherits tokumx::params {

  $package_ensure = $ensure ? {
    present => $version,
    default => absent,
  }

  if $::operatingsystem == 'Darwin' {
    homebrew::formula { 'tokumx': }
  }

  package { $package:
    ensure => $package_ensure,
  }

}
