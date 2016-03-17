require "pry"

def valid_password?(password)
  at_least_one_caps?(password) &&
  at_least_eight_characters?(password) # &&
  # at_least_one_lower_case?(password)
end

# Takes a string
# Returns true or false depending on if the string has at least one capital
# letter
def at_least_one_caps?(password)
  password != password.downcase
end

def at_least_eight_characters?(password)
  password.length >= 8
end

def at_least_one_lower_case?(password)
  letters = password.gsub(/[^a-z]/,"")
  letters.length != 0
end

def at_least_one_number?(password)
  numbers = password.gsub(/[^0-9]/,"")
  numbers.length != 0
end

def at_least_one_non_alpha_numeric?(password)
  characters = password.gsub(/[A-Za-z0-9]/,"")
  characters.length != 0
end

def check_for_password_string?(password)
  !password.downcase.include?("password")
end
binding.pry
