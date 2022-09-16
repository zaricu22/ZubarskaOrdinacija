import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import { Termin } from '../model/termin';

@Injectable({
  providedIn: 'root',
})
export class PacijentService {
  constructor(private http: HttpClient) {}

  pregledNeisteklihTerminaPacijent(): Observable<Array<Termin>> {
    let date = new Date();
    let datum =
      date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();

    let korisnikId: string = sessionStorage.getItem('id');
    let headers = new HttpHeaders();
    headers = headers.append('id', korisnikId);

    return this.http.get<Array<Termin>>(
      '/OrdinacijaREST/pregledNeisteklihTerminaPacijent/',
      { headers }
    );
  }

  zakazivanjeTermina(termin: Termin): Observable<string> {
    let korisnikId: string = sessionStorage.getItem('id');
    termin.korisnik.identifikacioniBroj = korisnikId;
    let headers = new HttpHeaders();
    headers = headers.append('id', korisnikId);
    headers = headers.append('Content-Type', 'application/json');

    const body = JSON.stringify(termin);

    return this.http.post<string>('/OrdinacijaREST/zakazivanjeTermina', body, {
      headers,
    });
  }

  otkazivanjeTermina(datum: string): Observable<string> {
    let korisnikId: string = sessionStorage.getItem('id');
    let headers = new HttpHeaders();
    headers = headers.append('id', korisnikId);

    const body = {};

    return this.http.put<string>(
      '/OrdinacijaREST/otkazivanjeTermina/' + datum,
      body,
      { headers }
    );
  }
}
