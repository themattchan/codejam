#include <stdio.h>
#define error "Case #%d: INSOMNIA\n"
#define fmt "Case #%d: %d\n"
#define ALLSET 0b1111111111

void setBV (unsigned int *bv, int n)
{
	while (n > 0) {
		*bv |= 1 << (n % 10);
		n /= 10;
	}
}

int countSheep(int n)
{
	if (n == 0) return -1;
	int m = n;
	unsigned int bv = 0, bv1 = 0;
	setBV(&bv, m);

	while (1) {
		if (bv == ALLSET) {
			return m;
		} else {
			m += n;
			bv1 = bv;
			setBV(&bv, m);
		}
	}
	return m;
}

int main()
{
	int iters, n;
	FILE* input = fopen("A-small-attempt5.in", "r");
	FILE* output = fopen("A-small-attempt5.out", "w+");
	fscanf(input, "%d", &iters);
	for (int i = 1; i <= iters; i++) {
		fscanf(input, "%d", &n);
		int r = countSheep(n);
		if (r == -1)
			fprintf(output, error, i);
		else
			fprintf(output, fmt, i, r);
	}
	fclose(input);
	fclose(output);
	return 0;
}
