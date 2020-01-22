# tbl2asn-forever

Proof of concept for tricking the infamous `tbl2asn` into thinking that it's
less than a year old:

Replace `/usr/bin/tbl2asn` with a shell script that temporarily modifies the
system time using [libefaketime](https://github.com/wolfcw/libfaketime) while
running the real `tbl2asn`
