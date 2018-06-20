package opk;

public class Stavka implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2270015402269216751L;
	 
	
	   private String isbn13, naslov;
	   private double cijena;
	   private int kolicina;

	   public Stavka (String isbn13,String naslov, double cijena)
	   {
	      this.isbn13 = isbn13;
	      this.naslov = naslov;
	      this.cijena = cijena;
	      this.kolicina = 1;
	   }
	   
	public String getIsbn13() {
		return isbn13;
	}

	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}

	public String getNaslov() {
		return naslov;
	}

	public void setNaslov(String naslov) {
		this.naslov = naslov;
	}

	public double getCijena() {
		return cijena;
	}

	public void setCijena(double cijena) {
		this.cijena = cijena;
	}
	

	public int getKolicina() {
		return kolicina;
	}

	public void setKolicina(int kolicina) {
		this.kolicina = kolicina;
	}
	 public void dodajKolicnu(int kolicina)
	   {   this.kolicina += kolicina;  }

	   

}
