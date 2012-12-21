package Perinci::Sub::FeatureUtil;

use 5.010;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       declare_function_feature
               );

our $VERSION = '0.01'; # VERSION

sub declare_function_feature {
    my %args   = @_;
    my $name   = $args{name}   or die "Please specify feature's name";
    my $schema = $args{schema} or die "Please specify feature's schema";

    $name =~ /\A\w+\z/
        or die "Invalid syntax on feature's name, please use alphanums only";

    require Rinci::Schema;
    # XXX merge first or use Perinci::Object, less fragile
    my $ff = $Rinci::Schema::function->[1]{"[merge+]keys"}{features}
        or die "BUG: Schema structure changed (1)";
    $ff->[1]{keys}
        or die "BUG: Schema structure changed (2)";
    $ff->[1]{keys}{$name}
        and die "Feature '$name' is already declared";
    $ff->[1]{keys}{$name} = $args{schema};
}

1;
# ABSTRACT: Utility routines for Perinci::Sub::Feature::* modules


__END__
=pod

=head1 NAME

Perinci::Sub::FeatureUtil - Utility routines for Perinci::Sub::Feature::* modules

=head1 VERSION

version 0.01

=head1 SYNOPSIS

=head1 FUNCTIONS

=head2 declare_function_feature

=head1 SEE ALSO

L<Perinci>

Perinci::Sub::Feature::* modules.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

