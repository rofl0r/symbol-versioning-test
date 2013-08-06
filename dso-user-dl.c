#include <dlfcn.h>
#include <assert.h>

typedef void (*functype)(void);
int main() {
	void* p = dlopen("libdso.so", RTLD_NOW);
	assert(p);
	functype fptr = dlsym(p, "func");
	assert(fptr);
	fptr();
	return 0;
}
