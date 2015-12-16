define couchbase::backupscript (
				$destination,
				$retention=undef,
				$logdir=undef,
				$compress=true,
				$mailto=undef,
				$idhost=undef,
				$backupscript='/usr/local/bin/backupcouchbase',
				$hour='2',
				$minute='0',
				$month=undef,
				$monthday=undef,
				$weekday=undef,
        $setcron=true,
        $username='admin',
        $password='passw0rd',
        $cbhost='localhost',
        $cbport='8091',
			) {
  #
  validate_absolute_path($destination)

  if defined(Class['netbackupclient'])
  {
    netbackupclient::includedir{ $destination: }
  }

  exec { "backupscript mkdir p $destination":
    command => "/bin/mkdir -p $destination",
    creates => $destination,
  }

  file { $destination:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Exec["backupscript mkdir p $destination"]
  }

  file { $backupscript:
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => template("${module_name}/backupcouchbase.erb")
  }

  file { "${backupscript}.config":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template("${module_name}/backupcouchbaseconfig.erb")
  }

  if($setcron)
  {
    cron { "cronjob couchbase backup ${name}":
      command  => $backupscript,
      user     => 'root',
      hour     => $hour,
      minute   => $minute,
			month    => $month,
			monthday => $monthday,
			weekday  => $weekday,
      require  => File[ [ $backupscript, $destination, "${backupscript}.config" ] ],
    }
  }

}
