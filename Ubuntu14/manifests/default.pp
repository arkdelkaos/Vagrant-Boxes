stage { "pre": before => Stage["main"] }
stage { "last": require => Stage["main"] }

#PRE
class { 'apt_update':
    exec { "aptGetUpdate":
        command => "sudo apt-get update",
        path => ["/bin", "/usr/bin"],
        stage => pre,
    }
}

class othertools {
    package { "git":
        ensure => latest,
        require => Exec["aptGetUpdate"],
        stage => pre,
    }
    package { "curl":
        ensure => present,
        require => Exec["aptGetUpdate"]
        stage => pre,
    }
}

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

#LAST
package { 'express':
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}

package { 'yo':
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}

package { 'generator-angular ':
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}

package { 'nodemon':
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}

package { 'bower':
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}

package { 'gulp':
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}

package { 'grunt-cli':
    provider => 'npm',
    require  => Class["nodejs"],
    stage => last,
}

package { 'compass':
    provider => 'gem',
}

file { "/etc/profile.d/node_path.sh":
    content => "PATH=\$PATH:/usr/local/node/node-default/bin\n",
}

package { 'n':
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
