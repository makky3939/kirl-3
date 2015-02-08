use utf8;

%index = ();
%result = ();

foreach $file_name (@ARGV){
    open(FILE, "<", $file_name) or die "Cannot open $file: $!";

    while ($line = <FILE>){
        chomp $line;
        @row = split(/\s+/, $line);
        $index{$row[0]}{$row[1]} = $row[4];
    }
    close(FILE) or die "Cannot close $file: $!";
}

while ($line = <STDIN>) {
    chomp $line;
    @row = split(/\s+/, $line);
    while (($doc_id, $terms) = each(%index)){
        while (($term, $weight) = each($terms)){
            if ($term eq $row[1]) {
                $result{$doc_id} += $weight;
            }
        }
    }
}

print "hit = ", scalar(keys %result), "\n";

foreach $document_id (sort {$result{$b} <=> $result{$a}} keys %result) {
    print "$document_id $result{$document_id}\n";
}
