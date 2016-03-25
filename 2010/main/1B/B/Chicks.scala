object Chicks {

  def pickupChicks(n: Int, k: Int, b: Int, t: Int, xs: Array[Int], vs: Array[Int]) = {
    val ranges = (xs,vs).zipped.map { (x,v) => x + (v*t) }

  }

  def readInts = readLine.split("\\s+").map(_.toInt)

  def main(args: Array[String]) = {
    val cases = readInt
    for (i <- 1 to cases) {
      val Array(n,k,b,t) = readInts
      val xs = readInts
      val vs = readInts
      val ans = pickupChicks(n,k,b,t,xs,vs).map(_.toString).getOrElse("IMPOSSIBLE")
      printf("Case #%d: %d\n", i, ans)
    }
  }
}
