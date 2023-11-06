##HW01- create game pao ying chub
import random as rm

def game():
    set_element = ["rock", "paper", "scissors"]
    random_element1 = rm.choice(set_element)
    random_element2 = rm.choice(set_element)
    print(f"player 1 : {random_element1}")
    print(f"player 2 : {random_element2}")

    # Win situations
    if (random_element1 == "rock" and random_element2 == "scissors") or \
       (random_element1 == "scissors" and random_element2 == "paper") or \
       (random_element1 == "paper" and random_element2 == "rock"):
        return "You win"
    elif random_element1 == random_element2:
        return "Draw"
    else:
        return "You lose"
result = game()
print(result)
