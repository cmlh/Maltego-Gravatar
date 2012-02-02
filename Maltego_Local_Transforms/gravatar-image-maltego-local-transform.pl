#!/usr/bin/env perl
# The above shebang is for "perlbrew", otherwise use /usr/bin/perl
#
# Please refer to the Plain Old Documentation (POD) at the end of this Perl Script for further information


# http://en.gravatar.com/site/implement/images/perl/


use strict;
use Carp;
use Pod::Usage;


my $VERSION = "0.0.1"; # May be required to upload script to CPAN i.e. http://www.cpan.org/scripts/submitting.html

# http://ctas.paterva.com/view/Specification#Message_Wrapper
print ("<MaltegoMessage>\n");
print ("<MaltegoTransformResponseMessage>\n");
print ("<UIMessages>\n");
print ("		<UIMessage MessageType=\"Inform\">Gravatar Image Local Transform v$VERSION</UIMessage>\n");
print ("</UIMessages>\n");

# Command line arguments from Maltego
my $maltego_selected_entity_value = $ARGV[0];
# Not used
my $maltego_additional_field_values = $ARGV[1];


# Process the command line arguments
chomp($maltego_selected_entity_value);
chomp($maltego_additional_field_values);

# http://ctas.paterva.com/view/Specification#Messages_to_STDERR_.28progress.2C_debug.29
print STDERR "Value of \$maltego_selected_entity_value is \"$maltego_selected_entity_value\"\n";

my $gravatar_image_url = "$maltego_selected_entity_value.jpg";

# http://ctas.paterva.com/view/Specification#Messages_to_STDERR_.28progress.2C_debug.29
print STDERR "Value of \$gravatar_image_url is \"$gravatar_image_url\"\n";

# http://ctas.paterva.com/view/Specification#Entity_definition
print ("\t<Entities>\n");
# TODO Return all for "Rating"s i.e. "g", "pg", "r" and "x" http://en.gravatar.com/site/implement/images/
print ("\t\t<Entity Type=\"maltego.image\"><Value>Gravatar Image</Value>\n");
print ("\t\t<AdditionalFields>\n");
print ("\t\t\t<Field Name=\"fullImage\">$gravatar_image_url</Field>\n");
print ("\t\t</AdditionalFields>\n");
# http://ctas.paterva.com/view/Specification#.3CIconURL.3E
print ("\t\t<IconURL>$maltego_selected_entity_value.jpg</IconURL>\n");
print ("\t</Entity>\n");
print ("\t</Entities>\n");


# http://ctas.paterva.com/view/Specification#Message_Wrapper
print ("</MaltegoTransformResponseMessage>\n");
print ("</MaltegoMessage>\n");




=head1 NAME

gravatar-image-maltego-local-transform.pl - "Gravatar Image - Maltego Local Transform"

=head1 VERSION

This documentation refers to "Gravatar Image Maltego Local Transform" Alpha $VERSION

=head1 CONFIGURATION

Please refer to https://github.com/cmlh/Maltego-Gravatar/wiki for further information 
	
=head1 USAGE

Please refer to https://github.com/cmlh/Maltego-Gravatar/wiki for further information 

=head1 REQUIRED ARGUEMENTS

$1 i.e. "Affilation - Gravatar" Entity

=head1 OPTIONAL ARGUEMENTS

=head1 DESCRIPTION

Please refer to https://github.com/cmlh/Maltego-Gravatar/README.pod

=head1 DEPENDENCIES

=head1 PREREQUISITES

=head1 COREQUISITES

=head1 OSNAMES

osx

=head1 SCRIPT CATEGORIES

Web

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

Please refer to the comments beginning with "TODO" in the Perl Code.

=head1 AUTHOR

Christian Heinrich

=head1 CONTACT INFORMATION

http://cmlh.id.au/contact

=head1 MAILING LIST

=head1 REPOSITORY

https://github.com/cmlh/Maltego-Gravatar

=head1 FURTHER INFORMATION AND UPDATES

http://cmlh.id.au/tagged/maltego

=head1 LICENSE AND COPYRIGHT

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. 

Copyright 2012 Christian Heinrich
