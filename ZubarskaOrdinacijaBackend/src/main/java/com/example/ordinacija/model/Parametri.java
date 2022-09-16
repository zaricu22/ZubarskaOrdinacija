package com.example.ordinacija.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Parametri {
	
	@Id
	private String parametarNaziv;

	private int parametarVrednost;

	public Parametri() {
		super();
	}

	public Parametri(String parametarNaziv, int parametarVrednost) {
		super();
		this.parametarNaziv = parametarNaziv;
		this.parametarVrednost = parametarVrednost;
	}



	public String getParametarNaziv() {
		return parametarNaziv;
	}

	public void setParametarNaziv(String parametarNaziv) {
		this.parametarNaziv = parametarNaziv;
	}

	public int getParametarVrednost() {
		return parametarVrednost;
	}

	public void setParametarVrednost(int parametarVrednost) {
		this.parametarVrednost = parametarVrednost;
	}
	
	
}
