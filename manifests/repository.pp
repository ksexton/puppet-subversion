class subversion::repository {
  file { $subversion::repository_dir: 
    ensure => "directory",
    owner => "apache",
    group => "apache",
    require => Class['subversion::install', 'apache'],
  }
  
  define create {

    $svn_array = split($::svn_repos, ':')
    if member($svn_array, $name) {
      
      notify { "${svn_array} has ${name} in it":}

    } else {
      
      notify { "${svn_array} doesn't have ${name} in it":}
      exec { "create repo ${name}":
        require => Class['sudoers'],
        command => "sudo -H -u apache svnadmin create ${subversion::repository_dir}/${name}",
        path    => "/usr/bin",
      }      
    }
  }

  create { $subversion::svn_repo: }

}


