class { "solr":
        source_url => "http://apache.mirrors.lucidnetworks.net/lucene/solr/4.2.0/apache-solr-4.2.0.tgz",
        home_dir => "/usr/share/solr",
        package => "solr-4.2.0",
        solr_data_dir => "/var/lib/solr/data",
        cores => ["ug_data", "cor"],
        tomcat_connector_port => "8983",
    }

  #Copy the default config file for tomcat6
  file { "/etc/default/tomcat6":
    ensure => present,
    source  => "/vagrant/tomcat6.default",
    group   => "root",
    owner   => "root",
    notify  => Service["tomcat6"],
  }

  #Copy the respective schema.xml file
  file { "/usr/share/solr/ug_data/conf/schema.xml":
    ensure => present,
    source  => "/vagrant/ug_data/schema.xml",
    group   => "tomcat6",
    owner   => "tomcat6",
    notify  => Service["tomcat6"],
  }

  #Copy the respective solrconfig.xml file
  file { "/usr/share/solr/ug_data/conf/solrconfig.xml":
    ensure => present,
    source  => "/vagrant/ug_data/solrconfig.xml",
    group   => "tomcat6",
    owner   => "tomcat6",
    notify  => Service["tomcat6"],
  }

  file { "/usr/share/solr/ug_data/conf/stopwords.txt":
    ensure => present,
    source  => "/vagrant/ug_data/stopwords.txt",
    group   => "tomcat6",
    owner   => "tomcat6",
    notify  => Service["tomcat6"],
  }

  file { "/usr/share/solr/ug_data/conf/synonyms.txt":
    ensure => present,
    source  => "/vagrant/ug_data/synonyms.txt",
    group   => "tomcat6",
    owner   => "tomcat6",
    notify  => Service["tomcat6"],
  }

#COR

  #Copy the respective schema.xml file
  file { "/usr/share/solr/cor/conf/schema.xml":
    ensure => present,
    source  => "/vagrant/cor/schema.xml",
    group   => "tomcat6",
    owner   => "tomcat6",
    notify  => Service["tomcat6"],
  }

  #Copy the respective solrconfig.xml file
  file { "/usr/share/solr/cor/conf/solrconfig.xml":
    ensure => present,
    source  => "/vagrant/cor/solrconfig.xml",
    group   => "tomcat6",
    owner   => "tomcat6",
    notify  => Service["tomcat6"],
  }

  file { "/usr/share/solr/cor/conf/stopwords.txt":
    ensure => present,
    source  => "/vagrant/cor/stopwords.txt",
    group   => "tomcat6",
    owner   => "tomcat6",
    notify  => Service["tomcat6"],
  }

  file { "/usr/share/solr/cor/conf/synonyms.txt":
    ensure => present,
    source  => "/vagrant/cor/synonyms.txt",
    group   => "tomcat6",
    owner   => "tomcat6",
    notify  => Service["tomcat6"],
  }
  
  file { "/usr/share/solr/cor/conf/spellings.txt":
    ensure => present,
    source  => "/vagrant/cor/spellings.txt",
    group   => "tomcat6",
    owner   => "tomcat6",
    notify  => Service["tomcat6"],
  }

