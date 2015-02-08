use utf8;

foreach $file_name (@ARGV){
    open(IN, , "<", $file_name) or die "Cannot open $file_name: $!";
    @lines = <IN>;
    $file_string = join(" ", @lines);
    $file_string =~ s/(\r|\n)//g;

    @elements = split(/(<DOC>.+?<\/DOC>)|(<QUERY>.+?<\/QUERY>)/, $file_string);

    foreach $element (@elements) {
        $number = "";
        $text = "";

        if ($element =~ /(<NUM>.+?<\/NUM>)/) {
            $number = $1;
            $number =~ s/<NUM>(.*)<\/NUM>/$1/;
        }

        if ($element =~ /(<TEXT>.+?<\/TEXT>)/) {
            $text = $1;
            $text =~ s/<TEXT>(.*)<\/TEXT>/$1/;
            $text =~ tr/A-Z/a-z/;
        }

        foreach $word (sort split(/\s+/, $text)) {
            $word =~ s/(\.|,)$//;
            print "$number $word\n";
        }

    }

    close(IN) or die "Cannot close $file: $!";
}
