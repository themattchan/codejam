import java.util.*;
import java.util.stream.*;
import java.io.*;

class StoreCredit {
	Scanner in; PrintWriter out;
	StoreCredit (Scanner in, PrintWriter out) {
		this.in = in; this.out = out;
	}

	public static void main(String[] args) throws Exception {
		Scanner in = new Scanner(new File("A-large-practice.in"));
        PrintWriter out = new PrintWriter(new FileOutputStream("A-large-practice.out", false));
		StoreCredit sc = new StoreCredit(in,out);

		//		sc.withHashMap();
		sc.withSortedByIndex();

        in.close();
        out.close();
	}

    // Also try doing this with quickselect...

	// The best because limits are low, needs ~32 ints
	private void withBitvector() throws Exception {
		int cases = in.nextInt();
        for (int i = 1; i <= cases; i++) {
			int C = in.nextInt();
            int N = in.nextInt();
			BitSet PS = new BitSet(1001);

			for (int j = 1; j <= N; j++)
                PS.set(in.nextInt(), true);


		}

		private void withHashMap() throws Exception {
			int cases = in.nextInt();
			for (int i = 1; i <= cases; i++) {
				int C = in.nextInt();
				int N = in.nextInt();

				Map<Integer,Integer> PS = new HashMap<>();

				for (int j = 1; j <= N; j++)
					PS.put(in.nextInt(), j);

				for (Map.Entry<Integer,Integer> kv : PS.entrySet()) {
					int k = kv.getKey(), v = kv.getValue();
					Optional<Integer> nv = Optional.of(PS.get(C-k));
					if (nv.isPresent()) {
						out.printf("Case #%d: %d %d\n", i,
								   Math.min(v,nv.get()), Math.max(v,nv.get()));
						break;
					}
				}
			}
		}

		private void withSortedByIndex() throws Exception {
			int cases = in.nextInt();
			for (int i = 1; i <= cases; i++) {
				int C = in.nextInt();
				int N = in.nextInt();
				int[] PS = new int[N];
				for (int j = 0; j < N; j++) {
					PS[j] = in.nextInt();
				}

				Integer[] IS = IntStream.range(0,N).boxed().toArray(Integer[]::new);
				Arrays.sort(IS, Comparator.comparingInt(j -> PS[j]));

				for (int x = 0, y = N-1 ;;) {
					if (PS[IS[x]] + PS[IS[y]] == C) {
						System.out.printf("Case #%d: %d %d\n", i, Math.min(IS[x]+1, IS[y]+1), Math.max(IS[x]+1,IS[y]+1));
						break;
					}
					else if (PS[IS[x]] + PS[IS[y]] < C) {
						x++;
					}
					else if (PS[IS[x]] + PS[IS[y]] > C) {
						y--;
					}
				}
			}
		}

		private void withSortedByBinsearch() throws Exception {}
	}
