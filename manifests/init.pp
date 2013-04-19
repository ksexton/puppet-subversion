class subversion (
  $repository_dir       = '/var/www/svn',
  $package_name         = 'subversion',
  $svn_repo             = hiera('svn_repo'),

  ) {

    include subversion::install
    include subversion::repository

    
  }
