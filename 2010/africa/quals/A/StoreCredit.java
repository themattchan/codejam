import java.util.*;
import java.io.*;

class StoreCredit {
    // Also try doing this with quickselect...
    public static void main(String[] args) throws Exception {
        Scanner in = new Scanner(new File("A-large-practice.in"));
        PrintWriter out = new PrintWriter(new FileOutputStream("A-large-practice.out", false));

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
        in.close();
        out.close();
    }
}
