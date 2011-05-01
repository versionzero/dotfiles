#!/usr/bin/perl -w

# watchfile:
# This script prints info about changes to the file(s) specified
# as command-line arguments.

# Options:
# By default, the script checks on the file(s) every 10 seconds.
# If you want to specify a different time interval, use the "-interval" option. 
# By default, the script does not report on access-time changes.
# If you want to be notified of access-time changes, use the "-atime" option
# If you want the script to calculate and compare an MD5 digest for each file,
# use the "-md5" option. This requires the Perl module Digest::MD5
# which is not installed by default. Note that access-time changes will not
# be reported if the "-md5" option is used since the file is accessed
# in order to compute the MD5 digest.

# Copyright 2003, Cameron Hayne.  All Rights Reserved.  
# This program is free software.  You may copy or
# redistribute it under the same terms as Perl itself.
# Created: September 2003  Cameron Hayne (macdev@hayne.net)

use strict;
use File::stat;

# function declarations
sub usage_error();
sub handle_command_line_options();
sub print_msg($$$);
sub check_file_stat($);
sub calc_md5($);

# global variables
my $interval = 10;    # time (in seconds) between checks
my $report_atime = 0; # whether to report on access time changes
my $want_md5 = 0;     # whether an md5 digest is to be computed for each file
my @filenames;        # names of files to be watched
my %fileinfo;         # file info hashed by filename

$| = 1; # enable autoflushing of output so this works better when piped
handle_command_line_options();

while (1)
{
    foreach my $filename (@filenames)
    {
	check_file_stat($filename);
    }
    sleep $interval;
}


#----- FUNCTIONS -----

sub usage_error()
{
    print STDERR
	"usage: watchfile [-interval n] [-atime] [-md5] filename(s)\n";
    exit(1);
}

sub handle_command_line_options()
{
    use Getopt::Long;

    GetOptions(
                'interval=i'    => \$interval,
                'atime'         => \$report_atime,
                'md5'           => \$want_md5,
                ) or usage_error();

    usage_error() unless scalar(@ARGV) >= 1; # must give a filename
    @filenames = @ARGV;

    # check validity of option values
    die "interval must be positive\n" if $interval <= 0;

    if ($want_md5)
    {
	# check that the MD5 module is installed
	unless (eval "require Digest::MD5")
	{
	    warn "Couldn't load Digest::MD5 - md5 digests will not be used\n";
	    $want_md5 = 0;
	}

	# Calculating the MD5 digest accesses the file
	# so there is no point in reporting on atime
	$report_atime = 0 if $want_md5;
    }
}

sub print_msg($$$)
{
    my ($filename, $msg, $show_info) = @_;

    my $date = localtime(time());

    print "$date: $filename: $msg\n";
    system("ls -l \"$filename\"") if $show_info;
}

sub check_file_stat($)
{
    my ($filename) = @_;

    # check that the file exists
    unless (-e $filename)
    {
	print_msg($filename, "No such file", 0);
	return;
    }

    my $info = stat($filename) or die "Can't stat file $filename: $!";
    my $md5 = "";
    if ($want_md5)
    {
	$md5 = calc_md5($filename);
	push(@$info, $md5);
    }

    # compare with previous info
    my $prev_info = $fileinfo{$filename};
    if ($prev_info)
    {
	my $mods = "";
	# see 'man stat' for the meaning of these fields
	$mods .= "ino "   if ($info->ino != $prev_info->ino);
	$mods .= "mode "  if ($info->mode != $prev_info->mode);
	$mods .= "nlink " if ($info->nlink != $prev_info->nlink);
	$mods .= "uid "   if ($info->uid != $prev_info->uid);
	$mods .= "gid "   if ($info->gid != $prev_info->gid);
	$mods .= "size "  if ($info->size != $prev_info->size);
	if ($want_md5)
	{
	    my $prev_md5 = pop(@$prev_info);
	    $mods .= "md5 " if ($md5 ne $prev_md5);
	}
	if ($report_atime)
	{
	    $mods .= "atime " if ($info->atime != $prev_info->atime);
	}
	$mods .= "mtime " if ($info->mtime != $prev_info->mtime);
	$mods .= "ctime " if ($info->ctime != $prev_info->ctime);

	if ($mods)
	{
	    print_msg($filename, "Changed: $mods", 1);
	}
    }
    else
    {
	print_msg($filename, "info stored", 1);
    }

    # store the latest info about the file
    $fileinfo{$filename} = $info;
}

sub calc_md5($)
{
    my ($filename) = @_;

    open(FILE, "<$filename") or die "Unable to open file $filename: $!";
    binmode(FILE);
    my $md5 = Digest::MD5->new->addfile(*FILE)->hexdigest;
    close(FILE);
    return $md5;
}

