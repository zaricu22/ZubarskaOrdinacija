import { Korisnik } from '../model/korisnik';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class PrijavaService {
  constructor(private http: HttpClient) {}

  korisnikProvera(id: string): Observable<Korisnik> {
    return this.http.get<Korisnik>('/OrdinacijaREST/korisnikProvera/' + id);
  }

  korisnikUnos(korisnik: Korisnik): Observable<string> {
    const headers = { 'content-type': 'application/json' };
    const body = JSON.stringify(korisnik);
    return this.http.post<string>('/OrdinacijaREST/korisnikUnos', body, {
      headers: headers,
    });
  }
}
