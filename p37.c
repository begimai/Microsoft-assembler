#include <stdio.h>

#define NSIZE (sizeof(unsigned) * 2) // (8 * sizeof(unsigned) / 4)

char charS[NSIZE+1];

void convertUintToHex(unsigned u, char s[])
{
	static const char* hexDigits = "0123456789ABCDEF";
	// static makes this array to be stored in global
	
	for(int i = NSIZE - 1; i >= 0; --i)
	{
		s[i] = hexDigits[(u & 0xF)];
		u >>= 4;
	}
		
	s[NSIZE] = 0;
}

int main(void)
{
	unsigned number;
		
	scanf("%u", &number);
	convertUintToHex(number, charS);
	
	puts(charS);
	
	return 0;
}
