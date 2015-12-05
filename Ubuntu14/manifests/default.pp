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
  stage => main,
}
exec { "apt-update":
    command => "/usr/bin/apt-get update",
    stage  => main,
}
