def quine
  puts "The word quine comes from the name of the mathematician \n
  Willard van Orman Quine, by way of Douglas Hofstadter's book Goedel, Escher,
  Bach. \n quoted from: 'http://rubyhacker.com/ruby-quine.html'."
end

def print_quine
  File.open("quine.rb", 'r') do |file|
    while line = file.gets
      puts line
    end
  end
end

print_quine
