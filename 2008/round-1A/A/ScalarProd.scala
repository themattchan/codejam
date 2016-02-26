import java.io._

object ScalarProd {

  def doProduct() = {
    readLine()
    val l1 = readLine.split(" ").map(_.toInt).sorted
    val l2 = readLine.split(" ").map(_.toInt).sorted.reverse
    (l1,l2).zipped.map(_ * _).sum
  }

  def main(args: Array[String]) = {
    val out = new BufferedWriter(new FileWriter(new File("A_out")))
    val cases = readInt
    for (i <- 1 to cases)
      out.write(s"Case #$i: ${ doProduct() }\n")
    out.close()
  }
}
