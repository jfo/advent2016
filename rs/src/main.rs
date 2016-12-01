use std::io::prelude::*;
use std::fs::File;

fn main() {
    let mut f = File::open("../inputs/1.txt").unwrap();
    let mut s = String::new();
    f.read_to_string(&mut s);
    let len = s.len();
    s.truncate(len - 1);

    for e in s.split(", ") {
        println!("{:?}", e);
    }
}
