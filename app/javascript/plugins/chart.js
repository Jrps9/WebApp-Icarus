const initChart = () => {
  const ctx0 = document.querySelector('#myChart')
  if (ctx0) {
    const ctx = ctx0.getContext('2d');
    const createChart = () => {
      const data = {
        labels: JSON.parse(ctx.canvas.dataset.cpts),
        datasets: [{
          data: JSON.parse(ctx.canvas.dataset.debts),
        }]
      };

      const image = new Image();
      image.src = 'https://res.cloudinary.com/dihaz37dr/image/upload/h_100,w_100/v1648329725/treasure_bn2fgr.png';
      const plugin = {
        id: 'custom_canvas_background_image',
        beforeDraw: (chart) => {
          if (image.complete) {
            const ctx = chart.ctx;
            const {top, left, width, height} = chart.chartArea;
            const x = left + width / 2 - image.width / 2;
            const y = top + height / 2 - image.height / 2;
            ctx.drawImage(image, x, y);
          } else {
            image.onload = () => chart.draw();
          }
        }
      };

      const config = {
        type: 'doughnut',
        data: data,
        options: {
          backgroundColor: [
            '#789564',
            '#73a3da',
            '#e4813f'
          ],
          hoverOffset: 4,
          cutout: "90%",
          plugins: {
            legend: {
              display: false,
            },
          },
          datasets: {
            backgroundColor: "red"
          }
        },
        plugins: [plugin],
      };

      new Chart(
        document.getElementById('myChart'),
        config
      );
    }
    createChart();
  }
}

export { initChart }