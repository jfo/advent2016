p File.open('./inputs/3.txt', "r")
      .readlines
      .collect! {|e| 
          e.split(' ').map!{|e| e.to_i }
      }
      .select{|e| e.inject(:+) > e.max * 2 }.count
