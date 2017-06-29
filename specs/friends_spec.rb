require( 'minitest/autorun' )
require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Rick",
      age: 12,
      monies: 1,
      friends: ["Jay","Keith","Dave", "Val"],
      favourites: {
        tv_show: "Friends",
        things_to_eat: ["charcuterie"]
      } 
    }
    
    @person2 = {
      name: "Jay",
      age: 15,
      monies: 2,
      friends: ["Keith"],
      favourites: {
        tv_show: "Baywatch",
        things_to_eat: ["soup","bread"]
      } 
    }

    @person3 = {
      name: "Val",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["ratatouille", "stew"]
      } 
    }

    @person4 = {
      name: "Keith",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay", "Dave"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["spaghetti"]
      } 
    }

    @person5 = {
      name: "Dave",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["spinach"]
      } 
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  def test_getting_name
    result = get_name(@person5)
    assert_equal("Dave", result)
  end

  # 1. For a given person, return their favourite tv show
  def test_get_tv_show_by_person
    result = get_tv_show_by_person(@person5)
    assert_equal("Scrubs", result)
  end

  # 2. For a given person, check if they like a particular food
  def test_check_if_person_likes_food
    result = check_if_person_likes_food(@person3, "Spaghetti")
    assert_equal("No they don't like this food", result)
  end

  def test_check_if_person_likes_food2
    result = check_if_person_likes_food(@person3, "Stew")
    assert_equal("Yes they like this food", result)
  end


  # 3. Allow a new friend to be added to a given person
  def test_add_new_friend
    result = add_new_friend(@person3, "Tony")
    assert_equal(["Rick", "Jay", "Tony"], result)
  end

  # 4. Allow a friend to be removed from a given person
  def test_remove_friend
    result = remove_friend(@person3, "Jay")
    assert_equal(["Rick"], result)
  end

  # 5. Find the total of everyone's money
  def test_sum_money
    result = sum_money(@people)
    assert_equal(143, result)
  end

  # 6. For two given people, allow the first person to loan a given value of money to the other
  def test_loan
    result = loan(@person5,@person4,20.0)

    assert_equal(40, result)
  end
  


  # 7. Find the set of everyone's favourite food joined together
  def test_all_food
    result = all_food(@people)
    assert_equal(["charcuterie", "soup", "bread", "ratatouille", "stew", "spaghetti", "spinach"], result)
  end

  # 8. Find people with no friends
  def test_no_friends 
    result = no_friends(@people)
    assert_equal(["Dave"], result)
  end

  # VERY tough
  # Find the people who have the same favourite tv show
  def test_match_tv_show
    result = match_tv_show(@people)
    assert_equal(["Val", "Keith"] , result)
  end

end
