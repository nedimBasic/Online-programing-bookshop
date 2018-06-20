package opk;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Kupac
 */
@WebServlet("/Kupac")
public class Kupac extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Kupac() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    // Automaski generisana metoda doGet() JavaBean Servleta
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	response.setContentType("text/html; charset=UTF-8");
    	response.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
     
    // Globalne varijable u koje smjestamo vrijednosti iz baze opk
        private int korisnikid;
        private String korisnickoime;
        private String imek;
        private String prezimek;
        private String lozinka;
        private String email;
        private String adresa;
        private String telefon;
        
        private boolean logged=false;
        

    	final private String host = "localhost";
    	final private String user = "root";
    	final private String passwd ="";

    	public int getKorisnikid() {
    		return korisnikid;
    	}

    	public void setKorisnikid(int korisnikid) {
    		this.korisnikid = korisnikid;
    	}

    	public String getKorisnickoime() {
    		return korisnickoime;
    	}

    	public void setKorisnickoime(String korisnickoime) {
    		this.korisnickoime = korisnickoime;
    	}

    	public String getImek() {
    		return imek;
    	}

    	public void setImek(String imek) {
    		this.imek = imek;
    	}

    	public String getPrezimek() {
    		return prezimek;
    	}

    	public void setPrezimek(String prezimek) {
    		this.prezimek = prezimek;
    	}

    	public String getLozinka() {
    		return lozinka;
    	}

    	public void setLozinka(String lozinka) {
    		this.lozinka = lozinka;
    	}

    	public String getEmail() {
    		return email;
    	}

    	public void setEmail(String email) {
    		this.email = email;
    	}

    	public String getAdresa() {
    		return adresa;
    	}

    	public void setAdresa(String adresa) {
    		this.adresa = adresa;
    	}

    	public String getTelefon() {
    		return telefon;
    	}

    	public void setTelefon(String telefon) {
    		this.telefon = telefon;
    	}

    	public boolean isLogged() {
    		return logged;
    	}

    	public void setLogged(boolean logged) {
    		this.logged = logged;
    	}
    	
    	
    	public  void clean(Connection con, PreparedStatement ps)
    	 { 
    	   try
    	   { if ( ps != null )  ps.close();
    	     if ( con != null) con.close();
    	   }
    	    catch(Exception ex)
    	    { System.out.println(ex.getMessage()); }
    	 }
        
    	//Metoda za prijavu postojećeg kupca
    	public void login() throws Exception
        {
         Connection con = null;
         PreparedStatement ps = null;
         try
         {
          con = connectToDB();
          ps = con.prepareStatement("select kupacid, korisnickoime, imekupca, prezimekupca, lozinka, email, telefon, adresa from kupci where korisnickoime = ? and lozinka= ?");
          ps.setString(1,korisnickoime);
          ps.setString(2,lozinka);

          ResultSet rs = ps.executeQuery();
          	if (rs.next())
          	{    korisnikid = rs.getInt("kupacid");
          		 korisnickoime = rs.getString("korisnickoime");
                 imek = rs.getString("imekupca");
                 prezimek= rs.getString("prezimekupca");
                 lozinka = rs.getString("lozinka");
                 email = rs.getString("email");
                 telefon = rs.getString("telefon");
                 adresa = rs.getString("adresa");
                 logged = true;
             } else  logged = false;
       
         } catch(Exception ex) {
          System.out.println( ex.getMessage()); }
           finally 
           {
        	   clean(con,ps);
           } 

        } // Kraj  metode login
    	
    	
    	// Pocetak metode registujKupca
    	
    	public String  registujKupca()
    	 {
    	    Connection con = null;
    	    PreparedStatement ps = null;

    	    try
    	    {
    	        con = connectToDB();;
    	        ps = con.prepareStatement("insert into kupci values (?,?,?,?,?,?,?,?)");
    	        korisnikid = getSljedeciKorisnikid(con);
    	        ps.setInt(1,korisnikid);
    	        ps.setString(2,korisnickoime);
    	        ps.setString(3,imek);
    	        ps.setString(4,prezimek);
    	        ps.setString(5,lozinka);
    	        ps.setString(6,email);
    	        ps.setString(7,adresa);
    	        ps.setString(8,telefon);
    	        ps.executeUpdate();
    	        logged=true;
    	        return null;

    	    }
    	    catch(Exception ex)
    	    {
    	       return ex.getMessage();
    	    }
    	    finally
    	    {  clean(con,ps); }
    	 }
    	// Kraj metode registruj kupca
    	
    	// Pocetak metode za uzimanje zadnjeg korisnickog id - a
    	public int getSljedeciKorisnikid(Connection con)  throws Exception
    	 {
    	    PreparedStatement ps = null;
    	    ps = con.prepareStatement("select max(kupacid)  from kupci");
    	    ResultSet rs = ps.executeQuery();
    	    rs.next();
    	    int nextuserid = rs.getInt(1);
    	    rs.close();

    	    return  nextuserid + 1; 
    	     
    	 }
    	// Kraj metode za uzimanje sljedeceg korisnikog id - a
    	
    	
    	// Pocetak metode 
    	 public String promijeniProfil(String novalozinka) 
    	 {
    	   Connection con = null;
    	   PreparedStatement ps= null;

    	   try
    	   {
    	     con = connectToDB();
    	     String cmd = "update kupci set email=?, telefon  = ? , adresa =? ";
    	 
    	     if (! novalozinka.equals(""))
    	         cmd += " , lozinka = '" + novalozinka + "'";
    	     
    	     cmd = cmd + " where kupacid  = ?";

    	     ps = con.prepareStatement(cmd);
    	     ps.setString(1,email);
    	     ps.setString(2,telefon);
    	     ps.setString(3,adresa);
    	     ps.setInt(4,korisnikid);

    	     int cnt = ps.executeUpdate();
    	     if ( cnt==1 ) 
    	     {
    	        if ( ! novalozinka.equals("") )
    	                lozinka  = novalozinka; 
    	        return null;
    	     }
    	     else
    	        return "Nepostojeći kupac. Nemoguće promijeniti podatke.";
    	      
    	  }
    	  catch(Exception ex)
    	  {
    	      System.out.println( ex.getMessage());
    	      return ex.getMessage();
    	  }
    	  finally
    	  {
    	       clean(con,ps);
    	  } 
    	 }
    	
    	// Automaski generisana metoda za Sevlet
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        	     response.setContentType("text/html; charset=UTF-8");
        	     response.setCharacterEncoding("UTF-8");
    		  }
        
        // Metoda za konekciju na opk Bazu sa usernamom root i bez passworda
        public Connection connectToDB() throws Exception {
    		try {
    		
    			// Ovo ce da ucita pokrene mySql driver, za svaku bazu podataka je drugaciji driver
    		     Class.forName("com.mysql.jdbc.Driver");
    		
    		     // Konekcija na zeljenu bazu podataka u MySql RDBM koju smo ranije kreirali sa phpMyAdmin alatom
    		     Connection con = DriverManager.getConnection("jdbc:mysql://" + host + "/opk?autoReconnect=true&useUnicode=yes&characterEncoding=UTF-8&"+ "user=" + user + "&password=" + passwd );
    		     return con;
    		     
    		  } catch (Exception e) {
    			throw e;
    		}
    	  
    	}
        
        //Metoda za odjavu
        public void logOut()
    	   {
    	     logged = false;
    	   }
}
