class couchbase (
                  $srcdir='/usr/local/src',
                  $enterprise=true,
                  $ensure='installed',
                  $datadir='/data',
                  $version='3.1.0',
                ) inherits params {

  if($enterprise)
  {
    $package_name=$enterprise_package_name
    $package_source=$enterprise_package_source[$version]
    $package_provider=$enterprise_package_provider

    if($package_source==undef)
    {
      fail('unsupported couchbase version')
    }
  }

  exec { "wget couchbase ${version}":
    command => "wget ${package_source} -O ${srcdir}/couchbase.${version}.dpkg",
    creates => "${srcdir}/couchbase.${version}.dpkg",
    path    => '/usr/sbin:/usr/bin:/sbin:/bin',
    notify  => Package[$package_name],
    timeout => 300,
  }

  package { $package_name:
    ensure   => $ensure,
    provider => $package_provider,
    source   => "${srcdir}/couchbase.${version}.dpkg",
    require  => Exec["wget couchbase ${version}"],
  }

  file { $datadir:
    ensure  => 'directory',
    owner   => 'couchbase',
    group   => 'couchbase',
    mode    => '0755',
    require => Package[$package_name],
  }

  service { 'couchbase-server':
    ensure  => 'running',
    enable  => true,
    require => [ Package[$package_name], File[$datadir] ],
  }

  # if(defined(Class['logrotate']))
  # {
  #   logrotate::logs { 'couchdb':
  #     custom_file   => '/opt/couchbase/etc/logrotate.d/couchdb',
  #     log           => '/opt/couchbase/var/log/couchdb/*.log',
  #     frequency     => 'weekly',
  #     rotate        => '10',
  #     copytruncate  => true,
  #     delaycompress => true,
  #     compress      => true,
  #     notifempty    => true,
  #     missingok     => true,
  #     create_mode   => '0664',
  #     create_owner  => 'couchbase',
  #     create_group  => 'couchbase',
  #   }
  # }

}
