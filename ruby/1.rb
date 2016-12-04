input = File.open('./inputs/1.txt', "r").read.strip
input = input.split(', ').collect {|e| e.split('')}

DIRS = [:n, :e, :s, :w]

place = [0,0]
ori = 0
acc = []

input.each do |e|
    if e[0] == 'L'
        ori -= 1
    elsif e[0] == 'R'
        ori = (ori + 1) % 4
    end

    ori = 3 if ori == -1
    dist = e[1..-1].join.to_i

    case DIRS[ori]
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
acc = []
input.each do |e|
    if e[0] == 'L'
        ori -= 1
    elsif e[0] == 'R'
        ori = (ori + 1) % 4
    end

    ori = 3 if ori == -1
    dist = e[1..-1].join.to_i

    case DIRS[ori]
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
