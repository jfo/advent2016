require 'rotn'

@input = File.open('./inputs/4.txt', "r")
    .readlines.map {|e| e
        .scan(/(^.+)\-(\d+)\[(.+)\]/)
        .flatten
    }
    .select {|e| e[2] == e[0].split('')
                         .delete_if{|e| e == '-'}
                         .sort_by {|x| [-e[0].count(x), x] }
                         .uniq[0..4]
                         .join
    }

p @input .map { |e| e[1].to_i} .inject :+
p @input .map { |e| [
    e[0].rotn_shift({a:e[1].to_i % 26}),
    e[1]
]}.select { |e| e[0].include?("pole") }.first
