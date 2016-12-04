extern crate regex;
use std::io::prelude::*;
use std::fs::File;
use regex::Regex;

struct Record {
    encrypted_name: &'static str
    // sector_id: u32,
    // checksum: str
}

fn splitter(input: Option<&str>) -> Record {
    // might need to make this lazily static?
    let re = Regex::new(r"(^.+)-(\d+)\[(.+)\]").unwrap();

    // println!("{:?}", input.unwrap());

    let cap = re.captures(input.unwrap()).unwrap();
    println!("{:?}", cap.at(1));

    Record {
        encrypted_name: &cap.at(1).unwrap()
        // sector_id: cap.at(2).unwrap().parse().unwrap(),
        // checksum: cap.at(3).unwrap()
    }
}

fn main() {
    let mut f = File::open("../inputs/4.txt").unwrap();
    let mut s = String::new();
    f.read_to_string(&mut s).unwrap();

    let len = s.len();
    s.truncate(len - 1);

    splitter(s.split("\n").next());
}
