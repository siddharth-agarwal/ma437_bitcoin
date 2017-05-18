use Digest::SHA;

sub buf_to_hex { [~] $^buf.list».fmt: "%02x" }
my $initString = "abc";
my $increment = 1;
my $hexString = buf_to_hex sha256 ($initString ~ $increment).encode: 'ascii';

while !($hexString.substr(0,3) ~~ m/ 000 /) {
  ++$increment;
  $hexString = buf_to_hex sha256 ($initString ~ $increment).encode: 'ascii';
  say $hexString.substr(0,3);
}
say 'done with hexString ' ~ $hexString ~ 'and string ' ~ ($initString~$increment)
