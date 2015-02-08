#!/usr/bin/env ruby

def bob(a, b, c)
  t = a * b
  if t == 0
    return Rational(c, [a, b, c].max)
  end
  count = 0
  total = 0
  n = ([a, b, c].min)
  if a >= c and b >= c
    t = 2 * n * n
  elsif a < c and b < c
    ab = (a - b).abs
    t = 2 * (n * n + (2 + (ab * 2)) * n - 1)
    # a_n = 2 (n^2+4 n-1)
    puts "#{ab} #{a} #{b} #{c} [#{t}]"

  else
puts "XXXX #{a} #{b} #{c}"
exit
    t = 2 * (n * n) + 4 * n
  end
  puts "n = #{n} t = #{t}"
#  puts "#{"%5d" % t}/#{a * b * 4}"
  return Rational(t, a * b * 4)

  return Rational(1,1)
  (0 .. a * b * 2).each.with_index do |i, x|
    if i <= a * b
      count += 1
    else
      count -= 1
    end
    total += i * x
#    puts "(#{"%4d" % x})#{count}: #{i / 2.0} [#{total}]"
    break if i >= c
  end
end

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
end

data = Array.new

if nil
data << [ 1, 1, 1, 1, 2 ]
data << [ 2, 2, 2, 1, 2 ]
data << [ 3, 3, 3, 1, 2 ]
data << [ 20, 20, 20, 1, 2 ]

data << [ 3, 4, 5, 5, 6 ]
data << [ 4, 5, 6, 31, 40 ]
data << [ 5, 6, 7, 11, 15 ]
data << [ 6, 7, 8, 59, 84 ]
data << [ 7, 8, 9, 19, 28 ]
data << [ 8, 9, 10, 95, 144 ]
data << [ 9, 10, 11, 29, 45 ]
data << [ 10, 11, 12, 139, 220 ]
data << [ 11, 12, 13, 41, 66 ]
data << [ 12, 13, 14, 191, 312 ]
data << [ 13, 14, 15, 55, 91 ]
data << [ 14, 15, 16, 251, 420 ]
data << [ 15, 16, 17, 71, 120 ]
data << [ 16, 17, 18, 319, 544 ]
data << [ 17, 18, 19, 89, 153 ]
data << [ 18, 19, 20, 395, 684 ]
data << [ 19, 20, 21, 109, 190 ]
data << [ 20, 21, 22, 479, 840 ]
end

data << [ 1, 2, 3, 1, 1 ]
data << [ 2, 3, 4, 11, 12 ]
data << [ 3, 4, 5, 5, 6 ]
data << [ 4, 5, 6, 31, 40 ]
data << [ 5, 6, 7, 11, 15 ]
data << [ 6, 7, 8, 59, 84 ]
data << [ 7, 8, 9, 19, 28 ]
data << [ 8, 9, 10, 95, 144 ]
data << [ 9, 10, 11, 29, 45 ]
data << [ 10, 11, 12, 139, 220 ]
data << [ 11, 12, 13, 41, 66 ]
data << [ 12, 13, 14, 191, 312 ]
data << [ 13, 14, 15, 55, 91 ]
data << [ 14, 15, 16, 251, 420 ]
data << [ 15, 16, 17, 71, 120 ]
data << [ 16, 17, 18, 319, 544 ]
data << [ 17, 18, 19, 89, 153 ]
data << [ 18, 19, 20, 395, 684 ]
data << [ 19, 20, 21, 109, 190 ]
data << [ 20, 21, 22, 479, 840 ]

data << [ 1, 3, 4, 1, 1 ]
data << [ 2, 4, 5, 15, 16 ]
data << [ 3, 5, 6, 13, 15 ]
data << [ 4, 6, 7, 13, 16 ]
data << [ 5, 7, 8, 27, 35 ]
data << [ 6, 8, 9, 71, 96 ]
data << [ 7, 9, 10, 5, 7 ]
data << [ 8, 10, 11, 111, 160 ]
data << [ 9, 11, 12, 67, 99 ]
data << [ 10, 12, 13, 53, 80 ]
data << [ 11, 13, 14, 93, 143 ]
data << [ 12, 14, 15, 215, 336 ]
data << [ 13, 15, 16, 41, 65 ]
data << [ 14, 16, 17, 279, 448 ]
data << [ 15, 17, 18, 157, 255 ]
data << [ 16, 18, 19, 39, 64 ]
data << [ 17, 19, 20, 195, 323 ]
data << [ 18, 20, 21, 431, 720 ]
data << [ 19, 21, 22, 79, 133 ]
data << [ 20, 22, 23, 519, 880 ]


if nil
data << [ 1, 3, 2, 1, 2 ]
data << [ 2, 4, 3, 1, 2 ]
data << [ 3, 5, 4, 1, 2 ]
data << [ 4, 6, 5, 1, 2 ]
data << [ 5, 7, 6, 1, 2 ]
data << [ 6, 8, 7, 1, 2 ]
data << [ 7, 9, 8, 1, 2 ]
data << [ 8, 10, 9, 1, 2 ]
data << [ 9, 11, 10, 1, 2 ]
data << [ 10, 12, 11, 1, 2 ]
data << [ 11, 13, 12, 1, 2 ]
data << [ 12, 14, 13, 1, 2 ]
data << [ 13, 15, 14, 1, 2 ]
data << [ 14, 16, 15, 1, 2 ]
data << [ 15, 17, 16, 1, 2 ]
data << [ 16, 18, 17, 1, 2 ]
data << [ 17, 19, 18, 1, 2 ]
data << [ 18, 20, 19, 1, 2 ]
data << [ 19, 21, 20, 1, 2 ]
end

data << [ 1, 4, 5, 1, 1 ]
data << [ 2, 5, 6, 19, 20 ]
data << [ 3, 6, 7, 8, 9 ]
data << [ 4, 7, 8, 47, 56 ]
data << [ 5, 8, 9, 4, 5 ]
data << [ 6, 9, 10, 83, 108 ]
data << [ 7, 10, 11, 26, 35 ]
data << [ 8, 11, 12, 127, 176 ]
data << [ 9, 12, 13, 19, 27 ]
data << [ 10, 13, 14, 179, 260 ]
data << [ 11, 14, 15, 52, 77 ]
data << [ 12, 15, 16, 239, 360 ]
data << [ 13, 16, 17, 17, 26 ]
data << [ 14, 17, 18, 307, 476 ]
data << [ 15, 18, 19, 86, 135 ]
data << [ 16, 19, 20, 383, 608 ]
data << [ 17, 20, 21, 53, 85 ]
data << [ 18, 21, 22, 467, 756 ]
data << [ 19, 22, 23, 128, 209 ]
data << [ 20, 23, 24, 559, 920 ]


data.each do |a, b, c, n, d|
  a = bob(a, b, c)
  if a != Rational(n,d)
    p [a, b, c, n, d]
    puts "#{a}, #{Rational(n,d)}"
    exit
  end
end

