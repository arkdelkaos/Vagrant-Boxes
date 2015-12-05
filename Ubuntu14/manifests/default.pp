stage { "pre": before => Stage["main"] }
stage { "last": require => Stage["main"] }

#PRE
include git

#MAIN
class {'::mongodb::server':
  port    => 27018,
  verbose => true,
  stage => main,
}
class { 'nodejs':
  version => 'stable',
  stage => main,
}
class { 'apt-update':
    exec { 'apt-get update':
        command => "/usr/bin/apt-get update"
    },
    stage => main,
}
