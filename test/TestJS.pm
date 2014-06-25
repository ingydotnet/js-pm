package TestJS;
use Test::Base -Base;
use JS;

package TestJS::Filter;
use Test::Base::Filter -Base;

my $testdir = -d 'test' ? 'test' : 't';

sub run_js {
    my $command = shift;
    @INC = ("$testdir/testlib");
    $command =~ s{^js-cpan\s+}{};
    return "JS->new->run(qw($command))";
}

sub fix_t {
    my $path = shift;
    $path =~ s/^t/$testdir/gm;
    return $path;
}
