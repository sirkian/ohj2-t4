package test;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;

import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import model.Asiakas;
import model.dao.Dao;

@TestMethodOrder(OrderAnnotation.class)
class JUnit_test_asiakkaat {

	@Test
	@Order(1)
	public void testPoistaKaikki() {
		Dao dao = new Dao();
		dao.poistaKaikki("salis");
		ArrayList<Asiakas> asiakkaat = dao.listaaKaikki();
		assertEquals(0, asiakkaat.size());
	}
	
	@Test
	@Order(2)
	public void testLisaaAsiakas() {
		Dao dao = new Dao();
		Asiakas a1 = new Asiakas(1, "Teemu", "Testi", "0501231231", "testi@testi.fi");
		Asiakas a2 = new Asiakas(2, "Asd", "Ffg", "0500000000", "toinen@testi.fi");
		Asiakas a3 = new Asiakas(3, "Kalle", "Kolmas", "0509876543", "kolmas@testi.fi");
		Asiakas a4 = new Asiakas(4, "Numero", "Neljä", "0504444444", "neljäs@testi.fi");
		assertEquals(true, dao.lisaaAsiakas(a1));
		assertEquals(true, dao.lisaaAsiakas(a2));
		assertEquals(true, dao.lisaaAsiakas(a3));
		assertEquals(true, dao.lisaaAsiakas(a4));
	}

	@Test
	@Order(3)
	public void testMuutaAsiakas () {
		Dao dao = new Dao();
		Asiakas muutettava = dao.etsiAsiakas(1);
		muutettava.setEtunimi("Teukka");
		muutettava.setSukunimi("Testattava");
		muutettava.setPuhelin("1234567890");
		muutettava.setSposti("asdaad@asd.fi");
		dao.muutaAsiakas(muutettava);
		assertEquals("Teukka", dao.etsiAsiakas(1).getEtunimi());
		assertEquals("Testattava", dao.etsiAsiakas(1).getSukunimi());
		assertEquals("1234567890", dao.etsiAsiakas(1).getPuhelin());
		assertEquals("asdaad@asd.fi", dao.etsiAsiakas(1).getSposti());
	}
	
	@Test
	@Order(4)
	public void testPoistaAsiakas() {
		Dao dao = new Dao();
		dao.poistaAsiakas(1);
		assertEquals(null, dao.etsiAsiakas(1));
	}
}
