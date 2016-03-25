import java.util*;
import java.io.*;

class Chicks {

	private Optional<Integer> pickupChicks(int N, int K, int B, int T, int[] xs, int[] vs) {
		int[] ranges = new int[xs.length];
		for (int i = 0; i < ranges.length; i++) {
			ranges[i] = xs[i] + (vs[i] * T);
		}


	}

	private int[] strsToInts(String[] ss) {
		return Arrays.stream(ss).map(Integer::parseInt).toArray(size -> new int[size]);
	}

	public static void main(String[] args) {
		Scanner in = new Scanner(new File("B-small-practice.in"));
		PrintWriter out = new PrintWriter(new FileOutputStream("B-small-practice.out", false));
		int cases = in.nextInt();

		for (int i = 0; i < cases; i++) {
			int N,K,B,T;
			N = in.nextInt();
			K = in.nextInt();
			B = in.nextInt();
			T = in.nextInt();
			int[] xs = strsToInts(in.nextLine().split("\\s+"));
			int[] vs = strsToInts(in.nextLine().split("\\s+"));
			Optional<Integer> swaps = pickupChicks(N,K,B,T,xs,vs);
			String sswaps = swaps.map(Integer::toString).orElse("IMPOSSIBLE");
			out.println("Case #%d: %s", i, sswaps);
		}

		in.close();
		out.close();
	}
}
