#!/usr/bin/env ruby

def bob(a, b, c)
  t = a * b
  if t == 0
    return Rational(c, [a, b, c].max)
  end
  if a + b <= c
    return Rational(1, 1)
  end
  n = ([a, b, c].min)
  max_ab = [[a, c].min, [b, c].min].max
  if n == c
    t = 2 * n * n
#    puts "*#{t} = 2 * n * n"
  else
    q = (c - max_ab)**2
    t = -2 * (n * n - 2 * c * n + q)
puts "n = #{n}"
    puts "+#{t} = -2 * (#{n} * #{n} - 2 * #{c} * #{n} + #{q})"
  end
  return Rational(t, a * b * 4)
end

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
end

data << [1, 1, 1, 1, 2 ]
data << [1, 1, 2, 1, 1 ]
data << [1, 1, 3, 1, 1 ]
data << [4, 0, 3, 3, 4 ]
data << [0, 4, 3, 3, 4 ]
data << [0, 0, 4, 1, 1 ]
data << [4, 0, 4, 1, 1 ]
data << [0, 4, 4, 1, 1 ]

data = []

data << [7817, 734, 6383, 6016, 7817]

data.each do |a, b, c, n, d|
  x = bob(a, b, c)
  if x && x != Rational(n,d)
    p [a, b, c, n, d]
    puts "#{x}, #{Rational(n,d)}"
    exit
  else
    p [a, b, c, x]
  end
end

