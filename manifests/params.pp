class couchbase::params () {

	case $::osfamily
	{
		'Debian':
		{
			case $::operatingsystem
			{
				'Ubuntu':
				{
					case $::operatingsystemrelease
					{
						/^14.*$/:
						{
              $enterprise_package_name="couchbase-server"
              $enterprise_package_source=
								{
									"3.1.0" => "http://packages.couchbase.com/releases/3.1.0/couchbase-server-enterprise_3.1.0-ubuntu12.04_amd64.deb",
									"3.0.3" => "http://packages.couchbase.com/releases/3.0.3/couchbase-server-enterprise_3.0.3-ubuntu12.04_amd64.deb",
								}
              $enterprise_package_provider="dpkg"
						}
						default: { fail("Unsupported Ubuntu version! - $::operatingsystemrelease")  }
					}
				}
				'Debian': { fail("Unsupported")  }
				default: { fail("Unsupported Debian flavour!")  }
			}
		}
		default: { fail("Unsupported OS!")  }
	}
}
