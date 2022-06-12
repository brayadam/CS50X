from cs50 import get_string


def main():

    # Get text input from user
    text = get_string("Text: ")
    letters = count_letters(text)
    words = count_words(text)
    sentences = count_sentences(text)
    grade = formula(letters, words, sentences)
    result = round(grade)

# Prints out grade of text
    if(result < 1):
        print("Before Grade 1")
    elif(result > 16):
        print("Grade 16+")
    else:
        print(f"Grade", result)

# Counts letters in text


def count_letters(text):
    letters = 0
    i = 0
    for chars in text:
        if text[i].isalpha() == True:
            letters += 1
        else:
            letters += 0
        i += 1
    return letters

# Counts words in text


def count_words(text):
    words = 1
    for word in text:
        if word == " ":
            words += 1
    return words

# Counts sentences in text


def count_sentences(text):
    sentences = 0
    for sentence in text:
        if sentence == "?":
            sentences += 1

        elif sentence == "!":
            sentences += 1

        elif sentence == ".":
            sentences += 1

    return sentences
    

# Coleman-Liau formula
# This is the formula used to calculate the grading system


def formula(letters, words, sentences):
    try:
        l = letters / words * 100
    except ZeroDivisionError:
        l = 0
    try:
        s = sentences / words * 100
    except ZeroDivisionError:
        s = 0
    index = 0.0588 * l - 0.296 * s - 15.8
    return index


main()