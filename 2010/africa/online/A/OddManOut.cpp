#include <iostream>
#include <fstream>
using namespace std;

int main() {
	ifstream inp;
	ofstream out;
	inp.open("A-large-practice.in", ios::in);
	out.open("A-large-practice.out", ios::out);

	int n;
	inp >> n;

	for (int i = 1; i <= n; i++) {
		int m, tmp;
		inp >> m;
		int odd = 0;
		for (int j = 0; j < m; j++) {
			inp >> tmp;
			odd ^= tmp;
		}
		out << "Case #" << i << ": " << odd << endl;
	}
	return 0;
}
