#include <stdio.h>

int square(int n)
{
	return n * n;
}

int cube(int n)
{
	return n * n * n;
}

//void printTable(int n, int (*fp)(int)) can be written as
void printTable(int n, int fp(int))
{
	for(int i = 0; i <= n; ++i)
	{
		printf("%6d%20d\n", i, fp(i));
	}
}

int main(void)
{
	printTable(5, square);
	printf("------------------------\n");
	printTable(7, cube);
	
	return 0;
}
