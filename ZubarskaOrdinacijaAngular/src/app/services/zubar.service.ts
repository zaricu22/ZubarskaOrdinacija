import { Termin } from '../model/termin';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class ZubarService {
  constructor(private http: HttpClient) {}

  pregledTerminaZubarDan(datum: string): Observable<Array<Termin>> {
    let korisnikId: string = sessionStorage.getItem('id');
    let headers = new HttpHeaders();
    headers = headers.append('id', korisnikId);

    return this.http.get<Array<Termin>>(
      '/OrdinacijaREST/pregledTerminaZubarDan/' + datum,
      { headers }
    );
  }

  pregledTerminaZubarPeriod(
    datumPocetak: string,
    datumKraj: string
  ): Observable<Array<Termin>> {
    let korisnikId: string = sessionStorage.getItem('id');
    let headers = new HttpHeaders();
    headers = headers.append('id', korisnikId);
    let params = new HttpParams();
    params = params.append('datumPocetak', datumPocetak);
    params = params.append('datumKraj', datumKraj);

    return this.http.get<Array<Termin>>(
      '/OrdinacijaREST/pregledTerminaZubarPeriod',
      { headers: headers, params: params }
    );
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

  promeniRokOtkazivanja(rok: number): Observable<string> {
    let korisnikId: string = sessionStorage.getItem('id');
    let headers = new HttpHeaders();
    headers = headers.append('id', korisnikId);

    const body = {};

    return this.http.put<string>(
      '/OrdinacijaREST/promeniRokOtkazivanja/' + rok,
      body,
      { headers }
    );
  }

  zakazivanjeTermina(termin: Termin): Observable<string> {
    let korisnikId: string = sessionStorage.getItem('id');
    let headers = new HttpHeaders();
    headers = headers.append('id', korisnikId);
    headers = headers.append('Content-Type', 'application/json');

    const body = JSON.stringify(termin);

    return this.http.post<string>('/OrdinacijaREST/zakazivanjeTermina', body, {
      headers,
    });
  }
}
