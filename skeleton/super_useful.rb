# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    puts "That's not a number"
    nil
  end
end

# PHASE 3

class CoffeeError < StandardError
  def message
    puts "That's coffee, give me some fruit!"
  end
end

class NotAFruitError < StandardError
  def message
    puts "That's not a fruit!"
  end
end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif (maybe_fruit == "coffee")
    raise CoffeeError
  else
    raise NotAFruitError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
   begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    e.message
    retry
  rescue NotAFruitError => f
    f.message
  end
end

class YrsKnownError < StandardError
  def message
    puts "That's not long enough to be considered best friends!!!"
  end
end

class YrsKnownStringError < StandardError
  def message
    puts "Years known argument must be an integer value."
  end
end

class NameError < StandardError
  def message
    puts "Your friend should have a name..."
  end
end

class FavPastimeError < StandardError
  def message
    puts "The pastime should be something!"
  end
end
# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise YrsKnownError if yrs_known < 5
    raise YrsKnownStringError unless yrs_known.is_a?(Integer)
    raise NameError if name.length < 1
    raise FavPastimeError if fav_pastime.length < 1

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
