input = 'L4, L1, R4, R1, R1, L3, R5, L5, L2, L3, R2, R1, L4, R5, R4, L2, R1, R3, L5, R1, L3, L2, R5, L4, L5, R1, R2, L1, R5, L3, R2, R2, L1, R5, R2, L1, L1, R2, L1, R1, L2, L2, R4, R3, R2, L3, L188, L3, R2, R54, R1, R1, L2, L4, L3, L2, R3, L1, L1, R3, R5, L1, R5, L1, L1, R2, R4, R4, L5, L4, L1, R2, R4, R5, L2, L3, R5, L5, R1, R5, L2, R4, L2, L1, R4, R3, R4, L4, R3, L4, R78, R2, L3, R188, R2, R3, L2, R2, R3, R1, R5, R1, L1, L1, R4, R2, R1, R5, L1, R4, L4, R2, R5, L2, L5, R4, L3, L2, R1, R1, L5, L4, R1, L5, L1, L5, L1, L4, L3, L5, R4, R5, R2, L5, R5, R5, R4, R2, L1, L2, R3, R5, R5, R5, L2, L1, R4, R3, R1, L4, L2, L3, R2, L3, L5, L2, L2, L1, L2, R5, L2, L2, L3, L1, R1, L4, R2, L4, R3, R5, R3, R4, R1, R5, L3, L5, L5, L3, L2, L1, R3, L4, R3, R2, L1, R3, R1, L2, R4, L3, L3, L3, L1, L2'

input = input.split(', ').collect {|e| e.split('')}

place = [0,0]
ori = 0
dir = [:n, :e, :s, :w]
acc = []

input.each do |e|
    if e[0] == 'L'
        ori -= 1
    elsif e[0] == 'R'
        ori = (ori + 1) % 4
    end

    ori = 3 if ori == -1
    dist = e[1..-1].join.to_i

    case dir[ori]
    when :n
        place[1] += dist
    when :e
        place[0] += dist
    when :s
        place[1] -= dist 
    when :w
        place[0] -= dist
    end

end
p place.inject :+

place = [0,0]
ori = 0
dir = [:n, :e, :s, :w]
acc = []
input.each do |e|
    if e[0] == 'L'
        ori -= 1
    elsif e[0] == 'R'
        ori = (ori + 1) % 4
    end

    ori = 3 if ori == -1
    dist = e[1..-1].join.to_i

    case dir[ori]
    when :n
        dist.times do
            place[1] += 1
        acc.push place.clone
        end
    when :e
        dist.times do
            place[0] += 1
        acc.push place.clone
        end
    when :s
        dist.times do
            place[1] -= 1 
        acc.push place.clone
        end
    when :w
        dist.times do
            place[0] -= 1
        acc.push place.clone
        end
    end

end

p acc.reject {|e| acc.count(e) < 2}[0].inject :+
