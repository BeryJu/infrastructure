# Users
#
class beryjuorg_common::users {

  user { 'jens':
    ensure     => 'present',
    shell      => '/bin/bash',
    groups     => ['sudo'],
    managehome => true,
  }
  ->ssh_authorized_key { 'jens@beryju.org old':
    ensure => present,
    user   => 'jens',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC+kSfa9FWWsLxzqkojz28w7xu6PntQd09+1fACTkHOI+9opduAGNJx3+0FbEiOA309HRRyeodpBe6lmzFluMb3ZrvI+r1uwOC8G+O1eiO0+CG28wGTqa/Ww6KaqdEog9EgAIpHZvewwte4t4UBs3BYjF9vf+QpjdtD3zXaKEPsVledUlFQLLiEWW1uTGHBbbPdxKqPtyurEAvoorMKtqB/+NfskkqJoJzZj/M+qHE5Ga5izaUNt11gx4C+AM7RxHYHUuXEo7cOJFfDsJFSbEgCJe947pC7WBAdKXt1yF0i78H4wD19byI4i9+G2ZGHU/wLLU+VfKWGCv5k5thUfMLt',
  }
  ->ssh_authorized_key { 'jens@beryju.org new':
    ensure => present,
    user   => 'jens',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQDdKEwJwQA8pazibRc+X6Z0QzuPDZz8goUU1OBF2TIzzS86MqEJ22Rwo/51mhKdpALIszOI3x/qX3QiyBtdQU3qbC+XxyxxINXLwziksd/g8JgaTg04N5f/wOw5U/N5WNV2N0kkMxaychJdO5B2NX52hY+Mr+GNNJJKvBxsBRx7jGq+0KsZdCO1vRKXTb7yHSdQlThQDKW2IpHhw/q39Y8BzO2rnV2Zz6KSC8MrCM6BH7MBAWJyLLMuFUJPY/jJa9G6jkCYY51iUGxp5RuMuJQTsnzFSzGfjh2MWgVePBPvIyy/65DPjpRLgMJ7VRKNHkW03YVYS6TJxltGp9PrcQ1e/ksncKzrDTcQX1xcl1vliwmstODFZQLgou+NHJUWL8cc0tsjUzSXgVEzQuSQmfdiB3yhqczZSsA2c9J+tGL7u3KhSaQ9IGQSlPVRnOEOhvhDxa4lGohEaQyW9iwXi1PffkBO4KPLiXCX04a+LfQeGLfm9/arh0xljmAmtEu2eUk=',
  }

  user { 'ansible':
    ensure     => 'present',
    shell      => '/bin/bash',
    groups     => ['sudo'],
    managehome => true,
  }
  ->ssh_authorized_key { 'ansible':
    ensure => present,
    user   => 'ansible',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQCZeHRpeWfU2fB0uW5FqcEClH8z4t6Z5RYkdguD9uV5evocicg38+c1RXd/H2ndjZN2XRJOXNvAacl7p52t8nXH3U6oaQaUwu6MKHvRO60PrsrZLQJnPCAReJdg1S7+50s3oA9kBRmNtfPagTbwGMm01+2fEf1gyiQ5ENAFPnpjnc9k2XAHinu6rdjL09/mzE3bvBGLos+kpeS9iRG9uAGJ2mtfH2qwHEFe0+QwrVF5bmBf5e/MQGyCB2uuXT0JJ0YK5+SEahudGw0Gq8H1jhgYMS+tgyMN2K5c60a0JhQkh6e2XKoc7BxUD5YU8uQePOzYyrRuEruxvqq2xgK9BykVxyDd6Nh8UB1LmxZ31L7+jeCrGP6ZF5Z/xos6/AFIuErrCG3PvCWeFUdLWcvHqaa+q+kFqXwT1aT6RDR3EdPmvhFp1lVrpv+DgeApa7bne9Wsgd+Q0iwJSMLTggrnofK4hwex/yCyoXIwYxm+Vy1r4OwIZabEZqLDiikrS2pTTzc=',
  }

  user { 'vagrant':
    ensure => 'absent',
  }

}
