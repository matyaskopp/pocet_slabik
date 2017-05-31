#!/usr/bin/perl
use locale;
use utf8;
use Encode;

my @prefixes = qw/o za na pře ne po pro do/ ;

LOOP:while(<>)
{
  s/\n//;
  #printf("%s\t",$_);
  $_=Encode::decode_utf8( $_ );
  $dalsi=0;
  foreach my $i (@prefixes)
  {
    #if(/^$i[^u]?/i)#if(/^$i[^aeiouáéíóúùyý]/i)
    if(/^$i[^u]/i)#if(/^$i[^aeiouáéíóúùyý]/i)
    {
      s/^$i/|/i;
      break;
    }
    elsif(/^$i/i)
    {
      printf("X\n");
      next LOOP;  
    }
  }
  #replace r and l
  s/[aeo]u/a/i; # diphtong
  s/[^aeiouáéíóúùůyýě][rl]$/X|/gi; # r or l at the end of word
  s/[^aeiouáéíóúùůyýě][rl][^aeiouáéíóúùůyýě]/X|X/gi; 
  s/[aeiouáéíóúùůyýě]/|/gi;
  s/[^|]//gi;
  printf("%d\n",length($_));
}



