from cs50 import get_float

# TODO


def main():
    # Ask how much change the customer is owed in dollars
    change = 0
    while(change < 0.01):
        change = get_float("Change owed: ")
        cents = change * 100

    # Calculate the number of quarters to give the customer
    quarters = int(calculate_quarters(cents))
    cents = cents - quarters * 25

    # Calculate the number of dimes to give the customer
    dimes = int(calculate_dimes(cents))
    cents = cents - dimes * 10

    # Calculate the number of nickels to give to the customer
    nickels = int(calculate_nickels(cents))
    cents = cents - nickels * 5

    # Calculate the number of pennies to give the customer
    pennies = int(calculate_pennies(cents))
    cents = cents - pennies * 1

    # Sum coins
    coins = quarters + dimes + nickels + pennies

    # Print number of coins to give to customer
    print(coins)


def calculate_quarters(cents):
    calculate_quarters = cents / 25
    return calculate_quarters


def calculate_dimes(cents):
    calculate_dimes = cents / 10
    return calculate_dimes


def calculate_nickels(cents):
    calculate_nickels = cents / 5
    return calculate_nickels


def calculate_pennies(cents):
    calculate_pennies = cents / 1
    return calculate_pennies


main()