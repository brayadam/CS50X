#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef uint8_t BYTE;

int main(int argc, char *argv[])
{
    // Check usage
    if (argc != 2)
    {
        printf("Usage: ./recover IMAGE");
        return 1;
    }

    // Open input file
    FILE *infile = fopen(argv[1], "r");
    if (!infile)
    {
        printf("Could not open file");
        return 1;
    }

    // Set output file to null
    FILE *outfile = NULL;

    // Create buffer
    BYTE bytes[512];

    // Image counter
    int img_counter = 0;

    // Filename string
    char filename[8];

    // Read input file
    while (fread(bytes, sizeof(BYTE) * 512, 1, infile) == 1)
    {
        // Check first four bytes
        if (bytes[0] == 0xff && bytes[1] == 0xd8 && bytes[2] == 0xff && (bytes[3] & 0xf0) == 0xe0)
        {
            if (outfile != NULL)
            {
                fclose(outfile);
            }
            // If first four bytes match jpeg signature, open a new file for writing
            sprintf(filename, "%03i.jpg", img_counter++);
            outfile = fopen(filename, "w");
        }

        // Copy bytes from input file into output file until fread returns 0
        if (outfile != NULL)
        {
            fwrite(bytes, sizeof(BYTE) * 512, 1, outfile);
        }
    }

    // Close last opened output file
    if (outfile != NULL)
    {
        fclose(outfile);
    }

    // Close input file
    fclose(infile);
    return 0;

}