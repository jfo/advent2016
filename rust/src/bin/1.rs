use std::io::prelude::*;
use std::fs::File;

const NORTH : &'static [i32; 2] = &[0,  1];
const EAST  : &'static [i32; 2] = &[1,  0];
const SOUTH : &'static [i32; 2] = &[0, -1];
const WEST  : &'static [i32; 2] = &[-1, 0];
static CARDINALS  : [&'static[i32; 2]; 4] = [NORTH, EAST, SOUTH, WEST];

fn travl(dir: &[i32; 2], steps: i32) -> (i32, i32) {
    (dir[0] * steps, dir[1] * steps)
}

fn main() {
    let mut f = File::open("../inputs/1.txt").unwrap();
    let mut s = String::new();

    f.read_to_string(&mut s).unwrap();
    let len = s.len();
    s.truncate(len - 1);
    let tokens = s.split(", ");

    let directions = tokens.clone().scan(0, {|o, e|
        match e.chars().next().unwrap() {
            'L' => Some(CARDINALS[{*o = (*o + 3) % 4; *o}]),
            'R' => Some(CARDINALS[{*o = (*o + 1) % 4; *o}]),
             _  => None,
        }
    });

    let movements = tokens.clone().map(|e| e[1..].parse::<i32>().unwrap());
    let nodes = directions.zip(movements).map(|e| travl(e.0,e.1));
    let distance_traveled = nodes.fold(0, |acc, e| acc + e.0 + e.1);

    println!("{}", distance_traveled)
}
