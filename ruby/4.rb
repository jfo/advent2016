@input = File.open('./inputs/4.txt', "r")
    .readlines.map {|e| e
        .chomp
        .scan(/(^.+)\-(\d+)\[(.+)\]/)
        .flatten
        .map {|e| e.split('').delete_if {|e| e == '-'}}
    }
    .map {|e|
        [
            e[0].sort_by {|x| [-e[0].count(x), x] }.uniq[0..4].join,
            e[1].join.to_i,
            e[2].join
        ]
    }
    .select {|e| e[0] == e[2]}
    .map {|e| e[1]}
    .inject :+

p @input

