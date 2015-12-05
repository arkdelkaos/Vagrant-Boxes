include git
include '::mongodb::server'

class { 'nodejs':
  version => 'stable',
}

package { 'n':
  ensure   => 'present',
  provider => 'npm',
}
class basic_exec {
  exec { 'install_n_and_node-5.1.1':
    command => 'n 5.1.1',
  }
}

package { 'express':
  ensure   => 'present',
  provider => 'npm',
}
package { 'yo':
  ensure   => 'present',
  provider => 'npm',
}
package { 'generator-angular ':
  ensure   => 'present',
  provider => 'npm',
}
package { 'nodemon':
  ensure   => 'present',
  provider => 'npm',
}
package { 'bower':
  ensure   => 'present',
  provider => 'npm',
}
package { 'gulp':
  ensure   => 'present',
  provider => 'npm',
}
package { 'grunt-cli':
  ensure   => 'present',
  provider => 'npm',
}
