#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

// Prototypes
int count_letters(string text);
int count_words(string text);
int count_sentences(string text);
float formula(float letters, float words, float sentences);

int main(void)
{
    // Get text input from user
    string text = get_string("Text: ");

    // Stores the count of letters, words and sentences into a individual variables
    int x = count_letters(text);
    int y = count_words(text);
    int z = count_sentences(text);

    // Calculates a grade based on number of letters, words and sentences using formula function
    float grade = formula(x, y, z);

    // Rounds the grade to an integer and stores the result in a variable
    int result = (int) round(grade);

    // If grade is less than 1, print a message
    if (result < 1)
    {
        printf("Before Grade 1\n");
    }

    // If grade is higher than 16, print a message
    else if (result > 16)
    {
        printf("Grade 16+\n");
    }

    // If grade is between 1 - 6, print grade
    else
    {
        printf("Grade %i\n", result);
    }
}

// Counts the number of alphabetical characters in text input
int count_letters(string text)
{
    int letters = 0;
    for (int i = 0; i < strlen(text); i++)
    {
        if (isalpha(text[i]))
        {
            letters += 1;
        }
        else
        {
            letters += 0;
        }
    }

    return letters;
}

// Counts the number of words in the text input
// This is calculated by counting the number of spaces in text input starting from one
int count_words(string text)
{
    int spaces = 1;
    for (int i = 0; i < strlen(text); i++)
    {
        if (isspace(text[i]))
        {
            spaces += 1;
        }
        else
        {
            spaces += 0;
        }

    }
    return spaces;
}

// Counts the number of sentences in text input
// This is calculated by counting the characters '!' '.' '?' from text input
int count_sentences(string text)
{
    int sentences = 0;
    for (int i = 0; i < strlen(text); i++)
    {
        if (text[i] == '.')
        {
            sentences += 1;
        }
        else if (text[i] == '!')
        {
            sentences += 1;
        }
        else if (text[i] == '?')
        {
            sentences += 1;
        }
        else
        {
            sentences += 0;
        }
    }
    return sentences;
}

// Coleman-Liau formula
// This is the formula used to calculate the grading system
float formula(float letters, float words, float sentences)
{
    float l = letters / words * 100;
    float s = sentences / words * 100;
    float index = 0.0588 * l - 0.296 * s - 15.8;
    return index;
}