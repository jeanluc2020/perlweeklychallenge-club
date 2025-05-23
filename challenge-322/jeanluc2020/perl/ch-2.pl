#!/usr/bin/env perl
# https://theweeklychallenge.org/blog/perl-weekly-challenge-322/#TASK2
#
# Task 2: Rank Array
# ==================
#
# You are given an array of integers.
#
# Write a script to return an array of the ranks of each element: the lowest
# value has rank 1, next lowest rank 2, etc. If two elements are the same then
# they share the same rank.
#
## Example 1
##
## Input: @ints = (55, 22, 44, 33)
## Output: (4, 1, 3, 2)
#
#
## Example 2
##
## Input: @ints = (10, 10, 10)
## Output: (1, 1, 1)
#
#
## Example 3
##
## Input: @ints = (5, 1, 1, 4, 3)
## Output: (4, 1, 1, 3, 2)
#
############################################################
##
## discussion
##
############################################################
#
# We create a hash with all the elements of the array as keys.
# The values will be the rank. We achieve this by walking through
# the sorted array, and whenever we encounter a new value, we add
# 1 to our current rank, save the rank with the new value, and keep
# track of the current value. In the end, we walk the array and get
# the rank for each value from the hash.

use v5.36;

rank_array(55, 22, 44, 33);
rank_array(10, 10, 10);
rank_array(5, 1, 1, 4, 3);

sub rank_array( @ints ) {
    say "Input: (" . join(", ", @ints ) . ")";
    my $rank = 0;
    my $last = undef;
    my $ranks = {};
    foreach my $i (sort {$a <=> $b} @ints) {
        if( defined($last) && $last == $i  ) {
            next;
        }
        $rank++;
        $ranks->{$i} = $rank;
        $last = $i;
    }
    my @result = ();
    foreach my $i (@ints) {
        push @result, $ranks->{$i};
    }
    say "Output: (" . join(", ", @result ) . ")";
}

