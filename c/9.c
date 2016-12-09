#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *fp = fopen("../inputs/9.txt", "r");
    if (!fp) { exit (1); }

    char c;
    while ((c = getc(fp)) != EOF )
        printf("%c", c);
}
