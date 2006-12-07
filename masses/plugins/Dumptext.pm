package Dumptext;
use strict;
use Mail::SpamAssassin;
use Mail::SpamAssassin::Plugin;
our @ISA = qw(Mail::SpamAssassin::Plugin);

sub new {
  my ($class, $mailsa) = @_;
  $class = ref($class) || $class;
  my $self = $class->SUPER::new($mailsa);
  bless ($self, $class);
  return $self;
}

sub check_end {
  my ($self, $opts) = @_;
  my $array = $opts->{permsgstatus}->get_decoded_stripped_body_text_array();
  my $str = join (' ', @$array);
  $str =~ s/\s+/ /gs;
  print STDOUT "text: $str\n";
}

1;
