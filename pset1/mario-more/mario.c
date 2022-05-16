#include <cs50.h>
#include <stdio.h>

int main(void)
{
    //Get height from user
    int height;
    do
    {
        height = get_int("Enter height: ");
    }
    while (height < 1 || height > 8);


    //Height of pyramid
    for (int i = 0; i < height; i++)
    {
        //Left spaces
        for (int j = height - 1; j > i; j--)
        {
            printf(" ");
        }
        //Left hashes
        for (int k = 0; k <= i; k++)
        {
            printf("#");
        }

        //Middle spaces
        if (i < height)
        {
            printf("  ");
        }

        //Right hashes
        for (int l = 0; l <= i; l++)
        {
            printf("#");
        }

        printf("\n");
    }
}