#!/usr/bin/perl

print "Welcome to the area of a rectangle conversion\n\n";

print "Enter the length:";
$length = <STDIN>;
chomp($length);

print "Enter the width:";
$width = <STDIN>;
chomp($width);

$area = $length * $width;
printf("The area is %.2f\n", $area);
