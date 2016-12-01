use std::io::prelude::*;
use std::fs::File;

static NORTH : &'static [i32; 2] = &[0,  1];
static EAST  : &'static [i32; 2] = &[1,  0];
static SOUTH : &'static [i32; 2] = &[0, -1];
static WEST  : &'static [i32; 2] = &[-1, 0];

fn travl(dir: &[i32; 2], steps: i32) -> (i32, i32) {
    (dir[0] * steps, dir[1] * steps)
}

fn main() {
    let mut f = File::open("../inputs/1.txt").unwrap();
    let mut s = String::new();

    f.read_to_string(&mut s);
    let len = s.len();
    s.truncate(len - 1);

    let thing: Vec<_> = [1,2,3].iter().zip([4,5,6].iter()).map(|e| e.0 + e.1).collect();
    println!("{:?}", travl(NORTH, 4));

    // for e in s.split(", ") {
    //     println!("{:?}", e);
    // }
}

// if an instruction is modelled like, say, go north for 5 blocks:
// [[0, 1], 5]
// you could write a function that maps over the direction by multiplying by the distance
// [0, 5]
//
// do this to a collection of single instructions and then reduce the collection like:
// coll.push [0,0] for accumulator
// coll.reduce {|acc, el| acc[0] += el[0]; acc[1] += el[1] }
// or however more compactly that can be written
//
// you'll end up with the final position which can be summed for the answer.
