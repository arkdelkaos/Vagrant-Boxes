stage { "pre": before => Stage["main"] }
stage { "last": require => Stage["main"] }

#PRE
include git
exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

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
class apt-update {
    exec { "apt-get update":
        command => "/usr/bin/apt-get update"
    },
    stage => main,
}

#LAST
package { 'express':
    ensure   => 'present',
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}
package { 'yo':
    ensure   => 'present',
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}
package { 'generator-angular ':
    ensure   => 'present',
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}
package { 'nodemon':
    ensure   => 'present',
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}
package { 'bower':
    ensure   => 'present',
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}
package { 'gulp':
    ensure   => 'present',
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}
package { 'grunt-cli':
    ensure   => 'present',
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}
package { 'n':
    ensure   => 'present',
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
    }  
    class basic_exec {
        exec { 'install_n_and_node-5.1.1':
            command => 'n 5.1.1',
        },
    stage => last,
    }
