#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct instruction {
    int length;
    int times;
};

char* read_into_string(FILE* fp) {
    fseek(fp, 0L, SEEK_END);
    size_t sz = ftell(fp);
    rewind(fp);

    char *input = malloc(sz);
    char c;
    int i = 0;
    while ((c = getc(fp)) != EOF ) {
        input[i] = c;
        i++;
    }
    input[i] = '\0';
    return input;
}

long decompressed_length(char* input, int limit) {

    int length = 0;
    int index = 0;

    while (index != limit) {
        if (input[index] == '(') {
            char buffer[16];
            int i = 0;
            index++;
            while (input[index + i] != ')') {
                buffer[i] = input[index + i];
                i++;
            }
            index += i + 1;
            buffer[i] = '\0';

            char len[8];
            for (i = 0; buffer[i] != 'x'; i++) {
                len[i] = buffer[i];
            }
            len[i] = '\0';

            char times[8];
            int itwo = i + 1;
            for (i = 0; buffer[itwo] != '\0'; i++) {
                times[i] = buffer[itwo++];
            }
            times[i] = '\0';

            struct instruction inst = { strtoul(len, NULL, 10), strtoul(times, NULL, 10) };
            return length +
                decompressed_length(&input[index], inst.length) * inst.times +
                decompressed_length(&input[index + inst.length], limit - (index + inst.length));
        } else {
            length++;
        }

        index++;
    };

    return length;
}

int main() {
    FILE *fp = fopen("../inputs/9.txt", "r");
    if (!fp) { exit (1); }
    char* input = read_into_string(fp);
    printf("%li\n", decompressed_length(input, strlen(input) - 1));

    /* char *test = "A(2x5)BCDEFG"; */
    /* char *test = "(3x3)XYZ"; */
    /* char *test = "X(8x2)(3x3)ABCY"; */
    /* char *test = "(27x12)(20x12)(13x14)(7x10)(1x12)A"; */
    /* char *test = "(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN"; */

    printf("%li\n", decompressed_length(test, strlen(test)));


    free(input);
}
