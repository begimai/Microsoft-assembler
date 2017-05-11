#include <stdio.h>

#define NUM_OF_BITS (sizeof(unsigned) * 8)

char charS[NUM_OF_BITS + 1];

void convertUintToStr(unsigned u, char s[])
{
	for(int i = 0; i < NUM_OF_BITS; ++i)
	{
		charS[NUM_OF_BITS - 1 - i] = (u & 1) + '0';
		u >>= 1; // - u = u >> 1;
	}
	
	s[NUM_OF_BITS]= 0; // end of string, necessary for puts
}

int main(void)
{
	unsigned number;
		
	scanf("%u", &number);
	convertUintToStr(number, charS);
	
	puts(charS);
	
	return 0;
}
