# modules/dcc/manifests/init.pp - manage dcc stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3
# please not this module is part of a whole series of modules

# modules_dir { "dcc": }

class dcc {
    case $operatingsystem {
        gentoo: { include dcc::gentoo }
        default: { include dcc::base }
    }
}

class dcc::base {
    package{'dcc':
        ensure => installed,
    }
}

class dcc::gentoo inherits dcc::base {
    Package[dcc]{
        category => 'mail-filter',
    }
}
