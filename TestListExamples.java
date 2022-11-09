import static org.junit.Assert.*;
import org.junit.*;
import java.util.*;

public class TestListExamples {
  // Write your grading tests here!
  @Test
  public void testMerge() {
    ListExamples listex = new ListExamples();
    ArrayList<String> arrayList1 = new ArrayList<>();
    ArrayList<String> arrayList2 = new ArrayList<>();
    List<String> expected = new ArrayList<>();
    arrayList1.add("a");
    arrayList1.add("b");
    arrayList2.add("c");
    arrayList2.add("d");
    List<String> joined = ListExamples.merge(arrayList1, arrayList2);
    
    expected.add("a");
    expected.add("b");
    expected.add("c");
    expected.add("d");
    assertEquals(expected, joined);
  }
}
