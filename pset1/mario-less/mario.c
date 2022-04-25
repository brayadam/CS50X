#include <stdio.h>
#include <cs50.h>

int main(void)
{
    // Get height from user between 1-8
    int height;
    do
    {
        height = get_int("Enter height between 1-8: ");
    }
    while (height < 1 || height > 8);


    //Height of pyramid
    for (int a = 0; a < height; a++)
    {

        //Spaces
        for (int b = height - 1; b > a; b--)
        {
            printf(" ");
        }

        //Hashes
        for (int c = 0; c <= a; c++)
        {
            printf("#");
        }

        printf("\n");
    }
}