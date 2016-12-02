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
    let keys = s
        .split("\n")
        .map({|token| token.chars()})
        .map({|tokenlist|
            tokenlist.fold((1,1), {|coord, dir|
                match dir {
                    'U' => (coord.0 - 1, coord.1),
                    'D' => (coord.0 + 1, coord.1),
                    'R' => (coord.0, coord.1 + 1),
                    'L' => (coord.0, coord.1 - 1),
                     _ => coord
                }
            })
        }).map(|e| (clamp(e.0, 0,2), clamp(e.1, 0,2)));

    for i in keys {
        let y = i.0 as usize;
        let x = i.1 as usize;
        print!("{:?}", GRID_ONE[y][x]);
    }
}
