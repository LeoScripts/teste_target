// coloquei 2 senarios onde o 1º nao temos faturamento no final de semana e no 2º temos faturamento no sabado
// a contagem começa supondo que o 1º dia seja segunda-feira
const faturamentoDiario = [
  150, 200, 10, 300, 1.5, 0, 0, 250, 5, 75, 500, 1000, 25, 0,
];

const faturamentoFiltrado = faturamentoDiario.filter((valor) => valor > 0);

const menorFaturamento = Math.min(...faturamentoFiltrado);
const maiorFaturamento = Math.max(...faturamentoFiltrado);

const totalFaturamento = faturamentoFiltrado.reduce(
  (acc, valor) => acc + valor,
  0,
);

const mediaFaturamento = totalFaturamento / faturamentoFiltrado.length;

const diasAcimaDaMedia = faturamentoFiltrado.filter(
  (valor) => valor > mediaFaturamento,
).length;

console.log("Menor valor de faturamento:", menorFaturamento);
console.log("Maior valor de faturamento:", maiorFaturamento);
console.log("Dias acima da média:", diasAcimaDaMedia);
