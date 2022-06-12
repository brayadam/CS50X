from cs50 import get_int


# Get input from the user between 1-8
while True:
    height = get_int("Height: ")
    if height >= 1 and height <= 8:
        break

# Height of pyramid
for i in range(height):

    # Spaces
    for j in range(height - i - 1):
        print(" ", end="")

    # Hashes
    for k in range(i + 1):
        print("#", end="")
    print()