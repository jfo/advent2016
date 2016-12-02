extern crate nalgebra;
use std::io::prelude::*;
use std::fs::File;
use nalgebra::clamp;


static GRID_ONE  : [&'static[i32; 3]; 3] = [
    &[1,2,3],
    &[4,5,6],
    &[7,8,9]
];

fn main() {
    let mut f = File::open("../inputs/2.txt").unwrap();
    let mut s = String::new();
    f.read_to_string(&mut s).unwrap();
    let keys: Vec<i32> = s
        .split("\n")
        .map({|tokenlist|
            tokenlist.chars().fold((1,1), {|coord, dir|
                match dir {
                    'U' => (clamp(coord.0 - 1, 0,2), coord.1),
                    'D' => (clamp(coord.0 + 1, 0,2), coord.1),
                    'R' => (coord.0, clamp(coord.1 + 1, 0,2)),
                    'L' => (coord.0, clamp(coord.1 - 1, 0,2)),
                     _ => panic!("Malformed input")
                }
            })
        })
        .map(|coord| GRID_ONE[coord.0 as usize][coord.1 as usize])
        .collect();

    println!("{:?}", keys);
}
