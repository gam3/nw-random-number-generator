
require 'rational'
require 'pp'

data = Array.new


File.open('input9', 'r').each_line do |l|
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

#data.unshift [ 1, 1, 9, 1, 1, 1, 1]
#data.unshift [ 1, 1, 3, 1, 1, 1, 1]
#data.unshift [ 1, 1, 2, 1, 1, 1, 1]
#data.unshift [ 1, 1, 1, 1, 2, 1, 1]
#data.unshift [2, 2, 3, 7, 8, 2, 1]
#data.unshift [3013, 7117, 7291, 34827121, 42887042, 2, 1]

data = []
#data.unshift [5027, 2105, 4435, 615, 914]
#data << [ 4, 5, 6, 31, 40 ]
#data << [ 4, 4, 6, 7, 8 ] # 17/25
#data << [ 5, 5, 6, 17, 25 ] # 17/25
#data << [ 2, 3, 4, 11, 12 ] # 17/25
#data << [ 3, 4, 5, 10, 12 ] # 17/25

(1 .. 20).each do |i|
  data << [ i, i, i+2, 1, 2 ] # 17/25
end


data.each do |a, b, c, n, d, mult, g|
#  puts '----'
  pp [a, b, c, n, d, mult, g]
#  next if b >= c and  a >= c
  answer = Rational(n, d)
#  puts "answer: #{n} #{d} #{answer}"
  x = 0
  count = 0
  eecount = 0
  eedata = []
  eeecount = 0
  top = 0
  eql = 0
  (1 .. ([a, c].min * 2)).each do |i|
    (1 .. ([b, c].min * 2)).each do |j|
      ap = i / 2.0
      bp = j / 2.0
      if ap + bp <= c
        count += 1
      else
        eeecount += 1
        top = 1
      end
      if ap + bp == c
        eecount += 1
	eedata << [ap, bp]
      end
      x += 1
    end
  end
#  puts "Count = #{count} #{eecount} #{eeecount}"
  if (a < c && b < c)
#    puts "#{eecount} #{eecount - 1} #{(eecount - 1) / 2} #{eeecount}"
    if eecount == 0
      xx = 0
    else
      xx = (eecount - 1) / 2
    end
  elsif (a < c)
    xx = a
  elsif (b < c)
    xx = b
  else
    xx = c
  end
#  xx = 2839
  tcount = count + xx
  puts "x#{"%9d" % (tcount)} / #{(a * b * 4)}"
#  puts "p#{"%9d" % n}/#{d}"
  r1 = Rational(tcount, a * b * 4)
  r2 = Rational(n, d)
#  puts "#{r1} == #{r2}"
  File.open("a", 'a') do |file|
    file.puts "data << [ #{a}, #{b}, #{c}, #{r1.numerator}, #{r1.denominator} ]"
  end
  p eedata
#  exit if r1 != r2
end

