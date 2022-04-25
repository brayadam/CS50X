#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

int main(int argc, string argv[])
{
    //Check for only one command-line arguement and it is a digit else reprompt user
    if (argc == 2)
    {
        for (int i = 0; i < strlen(argv[1]); i++)
        {
            if (isdigit(argv[1][i]) == false)
            {
                printf("Usage: ./caesar key\n");
                return 1;
            }
        }

        //Convert argv[1] from a string to an int
        int k = atoi(argv[1]);

        //Prompt user for plaintext
        string s = get_string("plaintext:  ");
        printf("ciphertext: ");

        //Convert each character in plaintext to a char
        for (int i = 0, n = strlen(s); i < n; i++)
        {
            //Print lowercase plus key
            if (s[i] >= 'a' && s[i] <= 'z')
            {
                printf("%c", (((s[i] - 'a') + k) % 26) + 'a');
            }
            //Print uppercase plus key
            else if (s[i] >= 'A' && s[i] <= 'Z')
            {
                printf("%c", (((s[i] - 'A') + k) % 26) + 'A');
            }
            else
            {
                printf("%c", s[i]);
            }
        }
        printf("\n");
    }

    else
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

}