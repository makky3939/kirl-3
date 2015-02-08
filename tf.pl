use utf8;

$documents = ();

while($line = <STDIN>) {
    chomp $line;
    @row = split(/\s+/, $line);
    $documents{$row[0]}{$row[1]} += 1;
}

print scalar(keys %documents), "\n";

while (($document_id, $words) = each(%documents)) {
    while (($word, $total) = each($words)) {
	print "$document_id $word $total\n";
    }
}
