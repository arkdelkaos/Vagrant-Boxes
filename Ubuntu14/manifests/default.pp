include git
include '::mongodb::server'

class prepare {
  class { 'nodejs':
      version => 'stable',
  }
}
include prepare
package {'nodejs': ensure => present, require => Class['prepare'],}

package { 'express':
  ensure   => 'present',
  provider => 'npm',
    require  => Package['nodejs'],
}
package { 'yo':
  ensure   => 'present',
  provider => 'npm',
    require  => Package['nodejs'],
}
package { 'generator-angular ':
  ensure   => 'present',
  provider => 'npm',
    require  => Package['nodejs'],
}
package { 'nodemon':
  ensure   => 'present',
  provider => 'npm',
    require  => Package['nodejs'],
}
package { 'bower':
  ensure   => 'present',
  provider => 'npm',
    require  => Package['nodejs'],
}
package { 'gulp':
  ensure   => 'present',
  provider => 'npm',
    require  => Package['nodejs'],
}
package { 'grunt-cli':
  ensure   => 'present',
  provider => 'npm',
    require  => Package['nodejs'],
}
package { 'n':
  ensure   => 'present',
  provider => 'npm',
    require  => Package['nodejs'],
}
class basic_exec {
  exec { 'install_n_and_node-5.1.1':
    command => 'n 5.1.1',
  }
}
