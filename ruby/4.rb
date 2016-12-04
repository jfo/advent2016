require 'rotn'

@input = File.open('./inputs/4.txt', "r")
    .readlines.map {|e| e
        .chomp
        .scan(/(^.+\-)(\d+)\[(.+)\]/)
        .flatten
        .map {|e| e.split('') }
    }
    .map {|e|
        [
            e[0].delete_if{|e| e == '-'}.sort_by {|x| [-e[0].count(x), x] }.uniq[0..4].join,
            e[1].join.to_i,
            e[2].join,
            e[0].join
        ]
    }
    .select {|e| e[0] == e[2]}


p @input .map {|e| e[1]} .inject :+
p @input .map {|e| [e[3].rotn_shift({a:e[1] % 26}), e[1]]}.select {|e| e[0].include?("pole")}
