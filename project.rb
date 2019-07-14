

menu = 0

users = []

dictionary = {}

while menu != 3

  puts "***HLAVNI MENU***"

  puts "1. prihlasit hrace"
  puts "2. zobrazit prihlasene"
  puts "3.ukoncit prihlasovani"
  puts "vyber cislo: "
  menu=gets.to_i

  if menu == 1
    #1 vyber
    puts "jmeno hrace"
    nick = gets.to_s.chomp
    if dictionary.include?(nick)
      dictionary[nick]+=1
    else
      dictionary[nick] = 1
    end
    test_nick = nick
    counter = 2
    while(users.include?(test_nick))
      test_nick = nick + " " + counter.to_s
      counter+=1
    end
    if test_nick.eql? nick
      puts "Hrac byl zaregistrovan: #{nick}"
      else
      puts "Hrac s timto jmenem jiz byl zaregistrovan."
      puts "Hraci bylo prideleno jmeno: #{test_nick}"
    end

    users.push(test_nick)
  else
    if menu == 2
      #2 vyber
      puts "prihlaseni hraci:"
      users.length.times do |i|
        puts "#{i + 1}. : #{users[i]}"
      end
      puts "Chcete nejakeho hrace odhlasit? (ANO/NE)"
      volba = gets.to_s.chomp
      if volba.eql? "ANO"
        puts "Cislo hrace ke smazani: "
        ke_smazani = gets.to_i-1
        if(ke_smazani >= 0 && ke_smazani < users.length)
          bez_cisel = users[ke_smazani].tr("0-9", "")
          puts "Hrac #{users[ke_smazani]} odhlasen"
          dictionary[bez_cisel] =1
          users.delete_at(ke_smazani)
        end
      end
    end
    if menu==3
      #3 vyber
      puts "3.ukoncit prihlasovani"
      puts "ulozit?"
      puts "ANO/NE"
      volba=gets.to_s.chomp
      if volba.eql? "ANO"
        if users.length == 0
          puts "Neni uzivatel, jsi deges"
        else
          puts "Nejcasteji se vyskytuje jmeno: #{dictionary.max_by{ |k,v| v }[0]}"
          puts "Rozpis:"
          combins = users.combination(2).to_a
          for i in combins
            puts "#{i[0]} - #{i[1]}"
          end
        end
      end
    end

  end


end









