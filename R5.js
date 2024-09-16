const distanciaTotal = 125; 
const velocidadeCarro = 90; 
const velocidadeCaminhao = 80; 
const pedagios = 3; 
const atrasoPedagioCarro = 5 / 60; 

const tempoCaminhao = distanciaTotal / velocidadeCaminhao;
const tempoCarroSemAtraso = distanciaTotal / velocidadeCarro;
const tempoAtrasoCarro = pedagios * atrasoPedagioCarro;
const tempoCarro = tempoCarroSemAtraso + tempoAtrasoCarro;
const distanciaCarro = (velocidadeCarro * tempoCarroSemAtraso) / (velocidadeCarro + velocidadeCaminhao) * distanciaTotal;
const distanciaCaminhao = distanciaTotal - distanciaCarro;

console.log("Distância percorrida pelo carro até o ponto de encontro:", distanciaCarro.toFixed(2), "km\n");
console.log("Distância percorrida pelo caminhão até o ponto de encontro:", distanciaCaminhao.toFixed(2), "km\n");

if (distanciaCarro < distanciaCaminhao) {
  console.log("O carro estará mais próximo de Ribeirão Preto.");
} else if (distanciaCarro > distanciaCaminhao) {
  console.log("O caminhão estará mais próximo de Ribeirão Preto.");
} else {
  console.log("Ambos estarão à mesma distância de Ribeirão Preto.");
}
