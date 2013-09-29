use strict;
use warnings;
use Test::More;
use Algorithm::SpatialIndex;

my $tlibpath;
BEGIN {
  $tlibpath = -d "t" ? "t/lib" : "lib";
}
use lib $tlibpath;
use Algorithm::SpatialIndex::Test;

my $cfg = test_redis_config();
if (!$cfg) {
  plan skip_all => "Need redis config for testing redis backend";
  exit(0);
}
else {
  plan tests => 70;
}

use Algorithm::SpatialIndex::QTreeTest;
Algorithm::SpatialIndex::QTreeTest->run(
  'Redis',
  redis => $cfg, 
);
