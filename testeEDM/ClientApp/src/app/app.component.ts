import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  valorSaque: number = 0; 
  notasEntregues: string[] = [];
  saqueRealizado: boolean = false;

  constructor() {
    // Inicialize a propriedade saqueRealizado aqui, se necessário
    this.saqueRealizado = false;
  }

  realizarSaque() {
    this.notasEntregues = [];

    if (this.valorSaque > 0) {
      const notasDisponiveis = [100, 50, 20, 10];

      let valorRestante = this.valorSaque;
      let notasEntregues: string[] = [];

      for (const nota of notasDisponiveis) {
        const quantidadeNotas = Math.floor(valorRestante / nota);

        if (quantidadeNotas > 0) {
          notasEntregues.push(`Entregar ${quantidadeNotas} nota(s) de R$ ${nota.toFixed(2)}`);
          valorRestante %= nota * quantidadeNotas;
        }
      }

      if (valorRestante === 0) {
        this.notasEntregues = notasEntregues;
      } else {
        this.notasEntregues.push('Não é possível sacar o valor solicitado com as notas disponíveis.');
      }
    }
  }
}
