extern void func(void);

#ifdef USE_OLD
__asm__(".symver func,func@OLD");
#endif

int main() {
	func();
	return 0;
}
