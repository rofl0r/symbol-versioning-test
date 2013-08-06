#include <stdio.h>

__asm__(".symver func_old, func@OLD");
__asm__(".symver func_new, func@@NEW"); // @@ means "default symbol"

void func_old() {
	printf("old\n");
}

void func_new() {
	printf("new\n");
}
