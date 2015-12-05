stage { "pre": before => Stage["main"] }
stage { "last": require => Stage["main"] }

class apt_update {
    exec { 'aptGetUpdate':
        command => "sudo apt-get update",
        path => ["/bin", "/usr/bin"]
    }
}

class tools {
    package { "git":
        ensure => latest,
        require => Exec["aptGetUpdate"],
    }
    package { "curl":
        ensure => present,
        require => Exec["aptGetUpdate"],
    }
}

#MAIN
class {'::mongodb::server':
  port    => 27018,
  verbose => true,
}
class nodejs {
  exec { "git_clone_n":
    command => "git clone https://github.com/visionmedia/n.git /home/vagrant/n",
    path => ["/bin", "/usr/bin"],
    require => [Exec["aptGetUpdate"], Package["git"], Package["curl"], Package["g++"]]
  }

  exec { "install_n":
    command => "make install",
    path => ["/bin", "/usr/bin"],
    cwd => "/home/vagrant/n",
    require => Exec["git_clone_n"]
  }

  exec { "install_node":
    command => "n 5.1.1",
    path => ["/bin", "/usr/bin", "/usr/local/bin"],  
    require => [Exec["git_clone_n"], Exec["install_n"]]
  }
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
