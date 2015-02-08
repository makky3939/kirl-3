use utf8;

%documents = ();
%document_frequency = ();
$document_total = false;

while ($line = <STDIN>) {
    chomp $line;
    if ($document_total == false){
        $document_total = $line;
    } else {
        @row = split(/\s+/, $line);
        if(!defined $documents{$row[0]}){
            $documents{$row[0]} = {};
        }
        $document_frequency{$row[1]} += 1;
        $documents{$row[0]}{$row[1]} = $row[2];
    }
}

foreach $document_id (sort keys %documents){
    foreach $word (sort keys %{$documents{$document_id}}){
        $df = $document_frequency{$word};
        $tf = $documents{$document_id}{$word};
        $idf = log($document_total/$df) + 1;
        $weight = $tf * $idf;
        print "$document_id $word $tf $idf $weight\n";
    }
}
