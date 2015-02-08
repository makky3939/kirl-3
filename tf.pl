use utf8;

while($line = <STDIN>) {
    chomp $line;
    @row = split(/\s+/, $line);
    $word = $row[1];
    $word =~ s/(s$)|(er$)|(est$)|(ed$)|(ing$)//g;
					$word =~ s/tion$/te/g;

    print "$row[0] $word\n";
}
s1311495@unix02:~/perl/ex03$ emacs tf.pl
s1311495@unix02:~/perl/ex03$ cat tf.pl
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
