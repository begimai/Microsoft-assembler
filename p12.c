#include <stdio.h>

void badSwap(int a, int b)
{
	int t;
	t = a;
	a = b;
	b = t;
}

int x;
int y;

int main()
{
	scanf("%d", &x);
	scanf("%d", &y);
	printf("Before swap: x = %d, y = %d\n", x, y);
	badSwap(x, y);
	printf("After swap: x = %d, y = %d\n", x, y);
	
	return 0;
}
