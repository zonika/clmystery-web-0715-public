require 'spec_helper'

def the_murderer
  system("cd ..")
  raw_murderer = `sed -n '/Z/p' solution | tail -n 6 | cut -c 8,22,23,41`
  murderer_first_name = ""
  murderer_last_name = ""
  raw_murderer.each_line do |line|
    line.each_char.with_index do |char, i|
      if char.match(/\w/)
        if i == 0
          murderer_first_name << char
        else
          murderer_last_name << char
        end
      end
    end
  end

  "#{murderer_first_name} #{murderer_last_name}"
end

describe 'the murderer' do

  it "is..." do
    my_solution = "Jeremy Bowers"
    expect(my_solution).to be_the_murderer(/#{the_murderer}/i)
  end

end