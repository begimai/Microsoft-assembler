#include <stdio.h>

void goodSwap(int* pa, int* pb)

{
	int t;
	t = *pa;
	*pa = *pb;
	*pb = t;
}

int x;
int y;

int main()
{
	scanf("%d", &x);
	scanf("%d", &y);
	printf("Before swap: x = %d, y = %d\n", x, y);
	goodSwap(&x, &y);
	printf("After swap: x = %d, y = %d\n", x, y);
	
	return 0;
}
