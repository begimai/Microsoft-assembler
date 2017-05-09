#include <stdio.h>

int addTwoNumbers(int a, int b)
{
	return a + b;
}
int main()
{
	int a;
	int b;
	int z;
	scanf("%d%d", &a, &b);
	
	z = addTwoNumbers(a, b);
	printf("%d\n", z);
	return 0;
}
