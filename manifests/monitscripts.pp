class couchbase::monitscripts($basedir='/usr/local/bin')
  inherits couchbase::params {
  #

  file { "${basedir}/check_cb_bucket":
    ensure   => 'present',
    owner    => 'root',
    group    => 'root',
    mode     => '0755',
    source 	 => "puppet:///modules/${module_name}/check_cb_bucket.sh",
  }

  file { "${basedir}/check_cb_membership":
    ensure   => 'present',
    owner    => 'root',
    group    => 'root',
    mode     => '0755',
    source 	 => "puppet:///modules/${module_name}/check_cb_membership.sh",
  }

}
