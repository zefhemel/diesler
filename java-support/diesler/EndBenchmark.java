package diesler;

public class EndBenchmark {
  public static int endBenchmark() {
    return (int)(System.currentTimeMillis() - StartBenchmark.startTime);
  }
}
