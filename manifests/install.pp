class subversion::install {
  package {  "${subversion::package_name}":
    ensure => installed,
  }
}
