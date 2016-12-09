#include <stdio.h>
#include <stdlib.h>

int count(FILE* fp) {
    int num = 0;
    char c;
    while ((c = getc(fp)) != EOF )
        num++;
    return num;
}

int main() {
    FILE *fp = fopen("../inputs/9.txt", "r");
    if (!fp) { exit (1); }

    printf("%i", count(fp));
}
