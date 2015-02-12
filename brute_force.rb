
require 'rational'
require 'pp'

data = Array.new


File.open('input9', 'r').each_line.with_index do |l, i|
  next if i == 0
  l.chomp!
  ldata = l.split(/\s+/).map{|x| x.to_i}
  data << ldata
end

File.open('output9', 'r').each_line.with_index do |l, i|
  l.chomp!
#  puts "#{l}, #{i}"
  (a, b) = l.split(/\//)
  e = data[i]
  e << a.to_i
  e << b.to_i
  t = (e[0].to_i * e[1].to_i) / e[4].to_i
  if t == 0
    t = (e[0].to_i * e[1].to_i) * 2 / e[4].to_i
    e << 2
  else
    e << 1
  end
  e << t
end

def doit(data)
output = []
data.each do |a, b, c, n, d, mult, g|
  answer = Rational(n, d)
  count = 0
  ecount = 0
  (0 .. ([a, c].min - 1)).each do |i|
    (0 .. ([b, c].min - 1)).each do |j|
      if i + j + 1 < c
        count += 1
      end
      if i + j + 1 == c
	ecount += 1
      end
    end
  end
p [a, b, c]
  puts "#{count} #{ecount} #{count * 2 + ecount}/#{2 * a * b} #{Rational(count * 2 + ecount, 2 * a * b)}"
  r1 = Rational(count * 2 + ecount, 2 * a * b)
#  puts "#{type} #{r1} #{r2}"
  raise unless r1 == answer

#p [count, ecount]

end

#p output

end

#data = []

#(1 .. 11).each do |i|
#  data << [ i+1, 1, i, 1, 2 ] # 17/25
#end

#data << [1, 1, 3,  1,  1] # 1
#data << [3, 4, 5,  5,  6] # 2
#data << [2, 3, 3,  2,  3] # 3
#data << [3, 3, 3,  1,  2] # 5

doit(data)
