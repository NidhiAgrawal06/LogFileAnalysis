package test;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * Common fields for Apache Log demo.
 */
interface LogExampl {
  /** The number of fields that must be found. */
  public static final int NUM_FIELDS = 9;

  /** The sample log entry to be parsed. */
  public static final String logEntryLine = "h194n2fls308o1033.telia.com - - [09/Mar/2004:13:49:05 -0800] \"-\" 408 -";

}


/**
 * Parse an Apache log file with Regular Expressions
 */
public class sdgs implements LogExampl {

  public static void main(String argv[]) {

	  String logEntryPattern = "^(\\S+) (\\S+) (\\S+) \\[([\\w:/]+\\s[+\\-]\\d{4})\\] \"-\" (\\d{3}) (\\d+)";
    System.out.println("Using RE Pattern:");
    System.out.println(logEntryPattern);

    System.out.println("Input line is:");
    System.out.println(logEntryLine);

    Pattern p = Pattern.compile(logEntryPattern);
    Matcher matcher = p.matcher(logEntryLine);
    if (!matcher.matches() || 
      NUM_FIELDS != matcher.groupCount()) {
      System.err.println("Bad log entry (or problem with RE?):");
      System.err.println(logEntryLine);
      return;
    }
    System.out.println("IP Address: " + matcher.group(1));
    System.out.println("Date&Time: " + matcher.group(4));
    System.out.println("Request: " + matcher.group(5));
    System.out.println("Response: " + matcher.group(6));
    System.out.println("Bytes Sent: " + matcher.group(7));
    if (!matcher.group(8).equals("-"))
      System.out.println("Referer: " + matcher.group(8));
    System.out.println("Browser: " + matcher.group(9));
  }
}