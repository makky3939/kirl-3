use utf8;

while($line = <STDIN>) {
    chomp($line);
    @row = split(/\s+/, $line);

    if($row[1] !~ /^(a|an|and|in|of|the|because|to|by)$/){
        print "$row[0] $row[1]\n";
    }
}
