package Game;

import People.Villain;
import WorldMap.Country;
import com.google.common.base.Objects;
import java.util.List;

@SuppressWarnings("all")
public class CaseFile {
  private Villain responsible;
  
  private List<Country> escapePlan;
  
  private String report;
  
  private String objectStolen;
  
  private Country robberyCountry;
  
  public boolean checkSuspect(final Villain villain) {
    return Objects.equal(this.responsible, villain);
  }
}
