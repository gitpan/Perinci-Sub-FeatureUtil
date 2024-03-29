
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Utility routines for Perinci::Sub::Feature::* modules",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Perinci-Sub-FeatureUtil",
  "dist_version" => "0.01",
  "license" => "perl",
  "module_name" => "Perinci::Sub::FeatureUtil",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Rinci" => "v1.1.33",
    "Rinci::Schema" => "v1.1.32.1",
    "perl" => "5.010001"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
