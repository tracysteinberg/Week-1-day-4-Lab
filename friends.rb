def get_name(person)
  return person[:name]
end

def get_tv_show_by_person(person)
  return person[:favourites][:tv_show]
end

def check_if_person_likes_food(person, food)
   food = food.downcase
   if (person[:favourites][:things_to_eat].include?(food))
     return "Yes they like this food"
    else
      return "No they don't like this food"
   end
end

def add_new_friend(person, new_friend )
  return person[:friends] << new_friend
end

def remove_friend(person, old_friend)
  old_friend = old_friend.downcase
  old_friend.capitalize!
  person[:friends].delete(old_friend)
return person[:friends]
end

def sum_money(people)
  counter = 0
  for person in people do
   counter += person[:monies]
  
  end
  return counter
end

def loan(giver,borrower,amount)
  giver[:monies] - amount
  borrower[:monies] = borrower[:monies] + amount
  return borrower[:monies]
end

def all_food(people)
  fav_foods = []
  for person in people do
   fav_foods << person[:favourites][:things_to_eat]
  end
  return fav_foods.flatten
end

def no_friends(people)
  friendless = []
  for person in people
    if person[:friends][0] == nil
      friendless << person[:name]
    end
  end
  return friendless
end

def match_tv_show(people)
  all_tv_shows = []
  matched_tv = []
  matched_people = []

  for person in people
    all_tv_shows << person[:favourites][:tv_show]
  end
 
  for tv_show in all_tv_shows
    if all_tv_shows.count(tv_show) > 1
      matched_tv << tv_show
    end
  end
 
  for person in people
    for m_tv_show in matched_tv  
       if m_tv_show == person[:favourites][:tv_show]
        matched_people << person[:name]
      end
    end
   end
 
  return  matched_people.uniq 
end