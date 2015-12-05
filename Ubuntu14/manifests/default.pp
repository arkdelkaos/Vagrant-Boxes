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
    package { "g++":
        ensure => present,
        require => Exec["aptGetUpdate"]
    }
}

#MAIN
class {'::mongodb::server':
    port    => 27017,
    ensure  => "present"
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


include apt_update
include nodejs
class { 'ruby':
  gems_version  => 'latest'
}
include tools


package { 'express':
    provider => 'npm',
    require  => Class["nodejs"],
}

package { 'yo':
    provider => 'npm',
    require  => Class["nodejs"],
}

package { 'generator-angular ':
    provider => 'npm',
    require  => Class["nodejs"],
}

package { 'nodemon':
    provider => 'npm',
    require  => Class["nodejs"],
}

package { 'bower':
    provider => 'npm',
    require  => Class["nodejs"],
}

package { 'gulp':
    provider => 'npm',
    require  => Class["nodejs"],
}

package { 'grunt-cli':
    provider => 'npm',
    require  => Class["nodejs"],
}

package { 'generator-karma':
    provider => 'npm',
    require  => Class["nodejs"],
}

package { 'compass':
    provider => 'gem',
}
