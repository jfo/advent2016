use std::io::prelude::*;
use std::fs::File;

static GRID_ONE  : [&'static[i32; 3]; 3] = [
    &[1,2,3],
    &[4,5,6],
    &[7,8,9]
];

fn main() {
    let mut f = File::open("../inputs/2.txt").unwrap();
    let mut s = String::new();
    f.read_to_string(&mut s).unwrap();
    let mut tokens = s.split("\n").map(|token| token.chars());

    for e in tokens {
        for i in e {
            print!("{}", i);
        }
        println!("");
    }
}
