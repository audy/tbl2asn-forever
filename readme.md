# tbl2asn-forever

Proof of concept for tricking the infamous `tbl2asn` into thinking that it's
less than a year old:

Replace `/usr/bin/tbl2asn` with a shell script that temporarily modifies the
system time using [libefaketime](https://github.com/wolfcw/libfaketime) while
running the real `tbl2asn`

Building this `Dockerfile` demonstrates that you can run a `tbl2asn` binary
that is [more than a year old](https://anaconda.org/bioconda/tbl2asn/files)
without an error message.

`docker build --tag tbl2asn .` will run `tbl2asn` with and without faking the
time. You should only see an error message printed to /dev/stderr on the first
invokation.

The magic happens here:

```sh
LD_PRELOAD=/usr/lib/x86_64-linux-gnu/faketime/libfaketime.so.1 \
  FAKETIME="2019-01-01 00:00:01" \
  /usr/bin/real-tbl2asn $*
```

## Credit

Thanks to @milot-mirdita for showing me how to time travel with libfaketime.
