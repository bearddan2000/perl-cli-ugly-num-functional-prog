#!/usr/bin/env perl

#/*This function divides a by greatest divisible power of b*/
 sub maxDivide
 {
   my ($a, $b) = @_;
     return $a if($a % $b != 0);
     $a /= $b;
     return &maxDivide($a, $b);
 }

 # /* Function to check if a number is ugly or not */
 sub isUgly
 {
   my ($n, $ref_args, $no, $len) = @_;
   return ($no == 1)? 1 : 0 if($n >= $len);
   my @args = @$ref_args;
   my $a = &maxDivide($no, $args[$n]);
   return &isUgly($n+1, $ref_args, $a, $len);
 }
sub findUgly {
  my ($n, $i, $count, $ref_args, $len) = @_;
  return $i-1 if($n < $count);
  if(&isUgly(0, $ref_args, $i++, $len) == 1){
    $count++;
  }
  return &findUgly($n, $i, $count, $ref_args, $len);
}

# Driver Program to test above function
sub main
{
    my $input = 10;
    my @args = (2,3,5);
    printf("[INPUT] %d\n", $input);
    my $output = &findUgly($input, 1, 1, \@args, 3);
    printf "[OUTPUT] %d\n", $output;
}
&main;
