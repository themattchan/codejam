import java.util.*;
import java.io.*;

class Chicks {

	/* Consider this picture:
	 *
	 * -------Y-----Y------X-------Y---Y--X----Y------------------B------
	 *
	 * Because the chicks are sorted, look at the list from the end (i.e.
	 * closest to the barn). We want K Y chicks at the tail of the list, and if
	 * a Y chick is behind n X chicks, you need n swaps to move it up to the
	 * tail. This invariant is preserved after you move a Y chick up, i.e. there
	 * will still be at least n X chicks in front of the Y chick that follows
	 * the one you just rotated up.
	 */
	private static Optional<Integer> pickupChicks(int N, int K, int B, int T, int[] xs, int[] vs) {
		int swaps = 0, nonarrivals = 0, arrivals = 0;

		for (int i = N-1; i >= 0; i--) {
			if ((xs[i] + (vs[i] * T)) < B) {
				nonarrivals++;
			} else {
				swaps += nonarrivals;
				arrivals++;
				if (arrivals == K) break;
			}
		}

		if (arrivals >= K) return Optional.of(swaps);
		else return Optional.empty();
	}

	private static int[] strsToInts(String[] ss) {
		return Arrays.stream(ss).mapToInt(Integer::parseInt).toArray();
	}

	public static void main(String[] args) throws Exception {
		Scanner in = new Scanner(new File("B-large-practice.in"));
		PrintWriter out = new PrintWriter(new FileOutputStream("B-large-practice.out", false));

		int cases = in.nextInt();
		for (int i = 1; i <= cases; i++) {
			int N,K,B,T;
			N = in.nextInt();
			K = in.nextInt();
			B = in.nextInt();
			T = in.nextInt();
			in.nextLine();		// clear whitespace
			int[] xs = strsToInts(in.nextLine().split("\\s+"));
			int[] vs = strsToInts(in.nextLine().split("\\s+"));

			Optional<Integer> swaps = pickupChicks(N,K,B,T,xs,vs);
			String sswaps = swaps.map(String::valueOf).orElse("IMPOSSIBLE");
			out.printf("Case #%d: %s\n", i, sswaps);
		}

		in.close();
		out.close();
	}
}
