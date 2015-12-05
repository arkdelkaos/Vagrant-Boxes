class paquetes {
    exec { "apt-get update":
      command => "/usr/bin/apt-get update"
    }
    package { 'express':
      ensure   => 'present',
      provider => 'npm',
        require  => Class["nodejs"],
    }
    package { 'yo':
      ensure   => 'present',
      provider => 'npm',
        require  => Class["nodejs"],
    }
    package { 'generator-angular ':
      ensure   => 'present',
      provider => 'npm',
        require  => Class["nodejs"],
    }
    package { 'nodemon':
      ensure   => 'present',
      provider => 'npm',
        require  => Class["nodejs"],
    }
    package { 'bower':
      ensure   => 'present',
      provider => 'npm',
        require  => Class["nodejs"],
    }
    package { 'gulp':
      ensure   => 'present',
      provider => 'npm',
        require  => Class["nodejs"],
    }
    package { 'grunt-cli':
      ensure   => 'present',
      provider => 'npm',
        require  => Class["nodejs"],
    }
    package { 'n':
      ensure   => 'present',
      provider => 'npm',
        require  => Class["nodejs"],
    }
    class basic_exec {
      exec { 'install_n_and_node-5.1.1':
        command => 'n 5.1.1',
      }
    }
}

include git
include '::mongodb::server'
include nodejs
include paquetes
