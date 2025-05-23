#!/usr/bin/env perl
# https://theweeklychallenge.org/blog/perl-weekly-challenge-322/#TASK1
#
# Task 1: String Format
# =====================
#
# You are given a string and a positive integer.
#
# Write a script to format the string, removing any dashes, in groups of size
# given by the integer. The first group can be smaller than the integer but
# should have at least one character. Groups should be separated by dashes.
#
## Example 1
##
## Input: $str = "ABC-D-E-F", $i = 3
## Output: "ABC-DEF"
#
#
## Example 2
##
## Input: $str = "A-BC-D-E", $i = 2
## Output: "A-BC-DE"
#
#
## Example 3
##
## Input: $str = "-A-B-CD-E", $i = 4
## Output: "A-BCDE"
#
############################################################
##
## discussion
##
############################################################
#
# First, we get rid of all the '-' in $str.
# Then we pick the last $i characters and add them to the result
# string, adding a '-' on each step when necessary. In the end,
# if there are leftover characters, add another '-' and prepend
# them to the result.

use v5.36;

string_format("ABC-D-E-F", 3);
string_format("A-BC-D-E", 2);
string_format("-A-B-CD-E", 4);

sub string_format($str, $i) {
    say "Input: \$str = \"$str\", \$i = $i";
    $str =~ s/-//g;
    my $result = "";
    while(length($str) >= $i) {
        if(length($result)) {
            $result = "-$result";
        }
        $result = substr($str, -$i, $i) . "$result";
        $str =~ s/.{$i}$//;
    }
    if(length($str)) {
        $result = "${str}-$result";
    }
    say $result;
}
