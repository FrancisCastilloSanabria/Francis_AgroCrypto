import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { MetamaskService } from 'src/app/services/metamask.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  constructor(private metamaskService: MetamaskService, private router: Router) {}

  async connectMetamask() {
    const account = await this.metamaskService.connectWallet();

    if (account) {
      // Redirige a la página de inicio si se conecta exitosamente
      this.router.navigate(['/inicio']);
    }
  }
  
}
