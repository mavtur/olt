#!/usr/bin/perl
use strict;
use warnings;
use Term::ANSIColor qw(color colored);
use Browser::Open qw(open_browser);

my $green = color('green');
my $red = color('red');
my $white = color('white');
my $blue = color('blue');
my $reset = color('reset');
my $purple = color('magenta');

BEGIN {
    if ($^O eq 'MSWin32') {
        eval { require Win32::Console::ANSI; Win32::Console::ANSI->import(); };
    }
}

my $aabout = "
About:
----------
EPIOS is a mail and phone OSINT tool.
Doxbin is a forum where anyone can view/post dox.
WHOIS is an OSINT tool for getting information about a domain URL.
Namechk is an OSINT tool for knowing where a pseudonym is registered.
Breachforum is a forum where we can find leak, crack, DataBase, and a lot of other service.
Reverse Image is for research something but with a image.
EmobileTracker is used to obtain useful information about a phone number.
Web-Check allows you to obtain information about the location, security, certificates, and other aspects of a website using its URL.
";

my $intro = "
{+}-------------------------------------------------------------------{+}
                     *OSINT Tools by mavtur ©2025*
{+}-------------------------------------------------------------------{+}
";

my %urls = (
    EP1305 => "https://epieos.com/",
    D0x81n => "https://doxbin.org/",
    Wh015 => "https://who.is/",
    n4m3chk => "https://namechk.com/",
    Br34chf0rum5 => "https://breachforums.st",
    imgr3v3r53 => "https://www.reverseimagesearch.org/fr",
    EmobileTracker => "https://www.emobiletracker.com/",
    w38ch3ck => "https://web-check.xyz/",
    l34k100kup => "https://leak-lookup.com/",
    f0r3ns1c5 => "https://29a.ch/photo-forensics/#forensic-magnifier",
    p1m3y35 => "https://pimeyes.com/en",
    w3b4rc1v3 => "https://web.archive.org/",
    wh4t5myn4m3 => "https://whatsmyname.app/"
);

my %categories = (
    Phone => ["7 EmobileTracker"],
    Mail => ["1 EPIOS"],
    Username => ["4 Namechk", "9 Leak Lookup", "13 Whatsmyname"],
    Forums => ["2 Doxbin", "5 Breachforum"],
    Web => ["3 WHOIS", "8 Web-Check", "12 Web Archive"],
    Images => ["6 Reserse Image", "10 Forensics", "11 Pimeyes"]
);

sub open_url {
    my $url_key = shift;
    open_browser($urls{$url_key});
    print $green, "Redirected\n", $reset;
    print "\n\n\n\n";
    main();
}

sub About {
    print $aabout, $reset;
    print "\n\n\n\n";
    main();
}

my $listt_categories = "
    -> Mail:
        1. EPIOS
    -> Username:
        4. Namechk
        9. Leak Lookup
        13. Whatsmyname
    -> Forums:
        2. Doxbin
        5. Breachforum
    -> Web:
        3. WHOIS
        8. Web-Check
        12. Web Archive
    -> Images:
        6. Reserse Image
        10. Forensics
        11. Pimeyes
    -> Phone:
        7. EmobileTracker
";

sub main {
    print $blue, $intro, $reset;
    print "\n";
    print $white, "Options by Category:\n", $reset;
    print $purple, $listt_categories, $reset;
    print $green, "    -> 99. About\n", $reset;
    print $red, "    -> 00. Exit\n", $reset;
    print "\n";
    my $choice = <STDIN>;
    chomp $choice;
    if ($choice eq "1") {
        open_url("EP1305");
    } elsif ($choice eq "2") {
        open_url("D0x81n");
    } elsif ($choice eq "3") {
        open_url("Wh015");
    } elsif ($choice eq "4") {
        open_url("n4m3chk");
    } elsif ($choice eq "5") {
        open_url("Br34chf0rum5");
    } elsif ($choice eq "6") {
        open_url("imgr3v3r53");
    } elsif ($choice eq "7") {
        open_url("EmobileTracker");
    } elsif ($choice eq "8") {
        open_url("w38ch3ck");
    } elsif ($choice eq "9") {
        open_url("l34k100kup");
    } elsif ($choice eq "10") {
        open_url("f0r3ns1c5");
    } elsif ($choice eq "11") {
        open_url("p1m3y35");
    } elsif ($choice eq "12") {
        open_url("w3b4rc1v3");
    } elsif ($choice eq "13") {
        open_url("wh4t5myn4m3");
    } elsif ($choice eq "99") {
        About();
    } elsif ($choice eq "00") {
        exit;
    } else {
        print $red, "Choose an option !\n", $reset;
        print "\n\n\n\n";
        main();
    }
}

main();