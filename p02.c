#include <stdio.h>

int main(void)
{
	unsigned u;
	unsigned r;
	
	scanf("%d", &u);
	r = u + 2;
	
	printf("%d\n", r);
	return 0;
}

// O1 place
// O2 speed
// Ox general optimization
// to generate cl /Fa p02.c
// cl /help
// cl /Fa /Ox p02.c full optimization
// cl /Fa /Od p02.c without optimization

