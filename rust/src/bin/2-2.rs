use std::io::prelude::*;
use std::fs::File;
use std::collections::HashSet;
use std::iter::FromIterator;


static GRID : [&'static[i32; 5]; 5] = [
    &[0, 0, 1, 0, 0],
    &[0, 2, 3, 4, 0],
    &[5, 6, 7, 8, 9],
    &[0,10,11,12, 0],
    &[0, 0,13, 0, 0],
];

fn main() {
    let allowedarr = [(0,2),(1,1),(1,2),(1,3),(2,0),(2,1),(2,2),(2,3),(2,4),(3,1),(3,2),(3,3),(4,2)];
    let allowed = HashSet::<_>::from_iter(allowedarr.iter());

    let mut f = File::open("../inputs/2.txt").unwrap();
    let mut s = String::new();
    f.read_to_string(&mut s).unwrap();
    let len = s.len();
    s.truncate(len - 1);

    let keys: String = s
        .split("\n")
        .map(|tokenlist|
            tokenlist.chars().fold((2,0), |coord, dir| {
                let newcoord = match dir {
                    'U' => (coord.0 - 1, coord.1),
                    'D' => (coord.0 + 1, coord.1),
                    'R' => (coord.0, coord.1 + 1),
                    'L' => (coord.0, coord.1 - 1),
                    _ => panic!("Malformed input")
                };
                if allowed.contains(&newcoord) { newcoord } else { coord }
            })
        )
        .map(|coord| GRID[coord.0 as usize][coord.1 as usize])
        .map(|e| format!("{:x}", e))
        .collect::<Vec<String>>()
        .join("")
        .to_uppercase();

    println!("{}", keys);
}
