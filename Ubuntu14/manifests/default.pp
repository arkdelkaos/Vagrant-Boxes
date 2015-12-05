stage { "pre": before => Stage["main"] }
stage { "last": require => Stage["main"] }

class apt_update {
    exec { 'aptGetUpdate':
        command => "sudo apt-get update",
        path => ["/bin", "/usr/bin"]
    }
}
class apt_ruby {
    exec { 'aptRubyDev':
        command => "sudo apt-get install ruby1.9.1-dev",
        path => ["/bin", "/usr/bin"],
        require => Exec["aptGetUpdate"]
    }
}

class custom_mongo {
    exec { 'aptRepoMongo':
        command => "echo 'deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list",
        path => ["/bin", "/usr/bin"],
        require => Exec["aptGetUpdate"]
    }
    exec { 'aptMongo':
        command => "sudo apt-get install -y mongodb-org",
        path => ["/bin", "/usr/bin"],
        require => [Exec["aptGetUpdate"], Exec["aptRepoMongo"]]
    }
    exec { 'upMongo':
        command => "sudo service mongod start",
        path => ["/bin", "/usr/bin"],
        require => Exec["aptMongo"]
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
include custom_mongo
include apt_ruby
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
    require => Exec["aptRubyDev"],
}
