use utf8;

while($line = <STDIN>) {
    chomp $line;
    @row = split(/\s+/, $line);
    $word = $row[1];
    $word =~ s/(s$)|(er$)|(est$)|(ed$)|(ing$)//g;
    $word =~ s/tion$/te/g;

    print "$row[0] $word\n";
}
