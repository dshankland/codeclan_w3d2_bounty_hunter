require('pry-byebug')
require_relative('models/bounty.rb')

bounty1 = Bounty.new({'name' => 'Darren Shankland',
                      'species' => 'Human',
                      'value' => '100',
                      'last_location' => 'Renfrew Street, Glasgow'
                      })
bounty1.save()

bounty2 = Bounty.new({'name' => 'Jabba The Hutt',
                      'species' => 'Hutt',
                      'value' => '50000',
                      'last_location' => 'Tatooine'
                      })
bounty2.save()

# upodate bounty2 to be Han Solo and Human
bounty2.name = 'Han Solo'
bounty2.species = 'Human'
bounty2.update()

# delete all bounties
Bounty.delete_all()

# add a couple back in again
bounty1.save()
bounty2.save()
# delete bounty1
bounty1.delete()

# delete them all and add again - we'll get new ids
Bounty.delete_all()
bounty1.save()
bounty2.save()
# find by name Han Solo
find_by_name = Bounty.find_by_name('Han Soo')
binding.pry
# find by id
p "Found by name: #{find_by_name['name']} at id #{find_by_name['id']}"
find = Bounty.find(5)
p "Found by id: #{find['name']} at id #{find['id']}"
