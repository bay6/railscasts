def insert_blah
  arr = %w(marky had a blah lamb)
  arr.map{|x|x.gsub(/(*.)/){|match| "#{$1}blash" unless $1.inlcude? 'blah'}}
end