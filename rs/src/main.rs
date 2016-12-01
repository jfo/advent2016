use std::io::prelude::*;
use std::fs::File;

const NORTH : (i32, i32) = (0,  1);
const EAST  : (i32, i32) = (1,  0);
const SOUTH : (i32, i32) = (0, -1);
const WEST  : (i32, i32) = (-1, 0);

// will take a vector of turns "L" and "R" and map over them to produce a vector of cardinal
// directions
// NORTH = [0,  1]
// EAST =  [1,  0]
// SOUTH = [0, -1]
// WEST =  [-1, 0]
fn turns_to_cardinal() {
}

fn main() {
    let mut f = File::open("../inputs/1.txt").unwrap();
    let mut s = String::new();

    f.read_to_string(&mut s);
    let len = s.len();
    s.truncate(len - 1);

    let thing: Vec<_> = [1,2,3].iter().zip([4,5,6].iter()).map(|e| e.0 + e.1).collect();
    println!("{:?}", thing);

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
