#include <stdio.h>

int count = 0;

void badRec()
{
	printf("%d\n", ++count);
	badRec();
}

int main(void)
{
	badRec();
	
	printf("message will not be printed");
	return 0;
}
