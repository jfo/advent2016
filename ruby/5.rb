require 'digest'
@door = "abbhdwsy"

i = 0
acc = []
acc2 = {}

until acc2.keys.length == 8
    cand = Digest::MD5.hexdigest(@door + i.to_s)
    if cand[0..4] == "00000"
        acc << cand
        if cand[5].to_i < 8 && /\A\d+\z/.match(cand[5]) && !acc2.keys.include?(cand[5].to_i)
            acc2[cand[5].to_i] = cand[6]
        end
    end
    i += 1
end

puts acc.map{|e| e[5]}[0..7].join
puts acc2.sort.map{|e| e[1] }.join
