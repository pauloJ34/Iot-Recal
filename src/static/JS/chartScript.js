const list_canvas = document.getElementById("list-canvas");

function createCanvas(item) {
  let div = document.createElement("div");
  let canva = document.createElement("canvas");
  let div_2 = document.createElement("div");
  let icon = document.createElement("i");

  div.classList.add("item-canvas");

  canva.classList.add("canvas-chart");

  // div_2.classList.add("close-tab");

  // icon.classList.add("fas");
  // icon.classList.add("fa-times");
  // icon.classList.add("close-icon");

  div_2.appendChild(icon);

  div.appendChild(div_2);
  div.appendChild(canva);
  list_canvas.appendChild(div);

  create_open_close(item);
}

function create_open_close(index) {
  const canvas = document.querySelectorAll(".canvas-chart");
  const div_canvas = document.querySelectorAll(".item-canvas");
  const div_button_canvas = document.querySelectorAll(".close-tab");
  // const close_button_canvas = document.querySelectorAll(".close-icon");
  canvas[index].addEventListener("click", (e) => {
    if (!div_button_canvas[index].classList.contains("is-display-block")) {
      // div_button_canvas[index].classList.toggle("is-display-block");
      div_canvas[index].classList.toggle("is-absolute");
    }
  });
  // close_button_canvas[index].addEventListener("click", (e) => {
  //   if (div_button_canvas[index].classList.contains("is-display-block")) {
  //     div_button_canvas[index].classList.remove("is-display-block");
  //     div_canvas[index].classList.remove("is-absolute");
  //   }
  // });
}

function add_statistics(data, index) {
  console.log(data,"------------", index)

  // let cont = parseInt(index) + 1;
  const canvas = document.querySelectorAll(".canvas-chart")[index];
  const list_data_canvas = data[index];
  new Chart(canvas, {
    type: "line",
    data: {
      labels: list_data_canvas.column,
      datasets: [
        {
          label: list_data_canvas.name,
          data: list_data_canvas.data,
          borderWidth: 1,
        },
      ],
    },
    options: {
      onResize: () => {
          },
      scales: {
        y: {
          beginAtZero: true,
        },
      },
    },
  });
}

function canvas_itens(list_data) {
  for (let index in list_data) {
    createCanvas(index);
    add_statistics(list_data, index);
  }
}
fetch("http://127.0.0.1:8080/fielddata")
  .then((response) => {
    // ...
    // console.log(response.json())
    return response.json()
  })
  .then((data) => {
    // ...

    
    const itens = document.querySelectorAll(".item-canvas");
    for(let i of itens){
      i.remove()
    }

    let fields = data
    fields.map((fields) => {
      console.log(fields)
      canvas_itens(fields);
      })

  })
  .catch(function (error) {
    console.log(error);
  });
