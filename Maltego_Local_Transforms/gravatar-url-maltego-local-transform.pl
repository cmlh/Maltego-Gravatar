#!/usr/bin/env perl
# The above shebang is for "perlbrew", otherwise use /usr/bin/perl
#
# Please refer to the Plain Old Documentation (POD) at the end of this Perl Script for further information


# http://en.gravatar.com/site/implement/images/perl/


use strict;
use Carp;
use Pod::Usage;
use Digest::MD5 qw(md5_hex);


my $VERSION = "0.0.1"; # May be required to upload script to CPAN i.e. http://www.cpan.org/scripts/submitting.html

# Command line arguments from Maltego
my $maltego_selected_entity_value = $ARGV[0];
# Not used
my $maltego_additional_field_values = $ARGV[1];


# Process the command line arguments
chomp($maltego_selected_entity_value);
chomp($maltego_additional_field_values);

print STDERR "Value of \$maltego_selected_entity_value is \"$maltego_selected_entity_value\"\n";

# http://en.gravatar.com/site/implement/hash/
# TODO Refactor as subroutine i.e. "gravatar_hash"

# Trim leading and trailing whitespace from the email address
my $email_address = "$maltego_selected_entity_value";
$email_address =~ s/^\s+//;
$email_address =~ s/\s+$//;
print STDERR "Value of \$email_address after whitespace trim is \"$email_address\"\n";

# Force all characters of the e-mail address to lower-case
$email_address = lc($email_address);
print STDERR "Value of \$email_address after conversion to lowercase is \"$email_address\"\n";

# Calculate the MD5 hash of the e-mail address
my $md5_of_email_address = md5_hex($email_address);
print STDERR "Value of \$md5_of_email_address after conversion to lowercase is \"$md5_of_email_address\"\n";

# http://en.gravatar.com/site/implement/images/
my $gravatar_url = "http://www.gravatar.com/avatar/$md5_of_email_address";
print STDERR "Value of \$gravatar_url is \"$gravatar_url\"\n";
# TODO Return HTTP Status 404 i.e. [$image_url]?default=404 if there is no MD5 hash associated with the e-mail address i.e. "Default" within http://en.gravatar.com/site/implement/images/

# http://ctas.paterva.com/view/Specification#Message_Wrapper
print ("<MaltegoMessage>\n");
print ("<MaltegoTransformResponseMessage>\n");
print ("<UIMessages>\n");
print ("		<UIMessage MessageType=\"Inform\">To Gravatar Affilation - Local Transform v$VERSION</UIMessage>\n");
print ("</UIMessages>\n");


# http://ctas.paterva.com/view/Specification#Entity_definition
print ("\t<Entities>\n");
print ("\t\t<Entity Type=\"cmlh.MD5\"><Value>$md5_of_email_address</Value>\n");
print ("\t</Entity>\n");
print ("\t\t<Entity Type=\"cmlh.affiliation.gravatar\"><Value>$gravatar_url</Value>\n");
print ("\t\t<AdditionalFields>\n");
print ("\t\t\t<Field Name=\"properties.affiliation.gravatar\">$gravatar_url</Field>\n");
print ("\t\t</AdditionalFields>\n");
print ("\t</Entity>\n");
print ("\t</Entities>\n");

# http://ctas.paterva.com/view/Specification#Message_Wrapper
print ("</MaltegoTransformResponseMessage>\n");
print ("</MaltegoMessage>\n");




=head1 NAME

gravatar-url-maltego-local-transform.pl - "Gravatar URL - Maltego Local Transform"

=head1 VERSION

This documentation refers to "Gravatar URL - Maltego Local Transform" Alpha $VERSION

=head1 MALTEGO CONFIGURATION

Please refer to https://github.com/cmlh/Maltego-Gravatar/wiki for further information 

=head1 USAGE

Please refer to https://github.com/cmlh/Maltego-Gravatar/wiki for further information 

=head1 REQUIRED ARGUEMENTS

$1 i.e. "E-mail" Entity

=head1 OPTIONAL ARGUEMENTS

=head1 DESCRIPTION

Please refer to https://github.com/cmlh/Maltego-Gravatar/README.pod

=head1 DEPENDENCIES

=head1 PREREQUISITES

Importation of the "Affiliation - Gravatar" Entity

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

https://github.com/cmlh/Maltego

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
