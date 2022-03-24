const initChart = () => {
  const ctx = document.querySelector('#myChart').getContext('2d');
  if (ctx) {
    const data = {
      labels: JSON.parse(ctx.canvas.dataset.cpts),
      datasets: [{
        data: JSON.parse(ctx.canvas.dataset.debts),
      }]
    };

    const config = {
      type: 'doughnut',
      data: data,
      options: {
        backgroundColor: [
          'rgb(255, 99, 132)',
          'rgb(54, 162, 235)',
          'rgb(255, 205, 86)'
        ],
      }
    };

    new Chart(
      document.getElementById('myChart'),
      config
    );
  }
}

export { initChart }