#include <stdio.h>
#include <stdlib.h>

struct inst {
    int length;
    int times;
    char* cursor;
};

// library function for this I'm sure! from the file struct
int count_file_length(FILE* fp) {
    int num = 0;
    char c;
    while ((c = getc(fp)) != EOF ) {
        num++;
    }
    fseek(fp, -num, SEEK_CUR);
    return num;
}

// sure whatever
char* read_into_string(FILE* fp) {
    char *input = malloc(count_file_length(fp));
    char c;
    int i = 0;
    while ((c = getc(fp)) != EOF ) {
        input[i] = c;
        i++;
    }
    input[i] = '\0';
    return input;
}

int main() {
    FILE *fp = fopen("../inputs/9.txt", "r");
    if (!fp) { exit (1); }


    printf("%s", read_into_string(fp));
}
