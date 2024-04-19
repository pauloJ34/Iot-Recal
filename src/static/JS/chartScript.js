const list_canvas = document.getElementById("list-canvas");

function createCanvas() {
  let div = document.createElement("div");
  let canva = document.createElement("canvas");
  let div_2 = document.createElement("div");
  let icon = document.createElement("i");

  div.classList.add("item-canvas");

  canva.classList.add("canvas-chart");

  div_2.classList.add("close-tab");

  icon.classList.add("fas");
  icon.classList.add("fa-times");
  icon.classList.add("close-icon");

  div_2.appendChild(icon);

  div.appendChild(div_2);
  div.appendChild(canva);
  list_canvas.appendChild(div);
}

for (let index = 0; index < 5; index++) {
  createCanvas();
}

const canvas = document.querySelectorAll(".canvas-chart");
const div_canvas = document.querySelectorAll(".item-canvas");
const div_button_canvas = document.querySelectorAll(".close-tab");
const close_button_canvas = document.querySelectorAll(".close-icon");
for (let index = 0; index < div_canvas.length; index++) {
  canvas[index].addEventListener("click", (e) => {
    if (!div_button_canvas[index].classList.contains("is-display-block")) {
      div_button_canvas[index].classList.add("is-display-block");
      div_canvas[index].classList.add("is-absolute");
    }
  });
  close_button_canvas[index].addEventListener("click", (e) => {
    if (div_button_canvas[index].classList.contains("is-display-block")) {
      div_button_canvas[index].classList.remove("is-display-block");
      div_canvas[index].classList.remove("is-absolute");
    }
  });
}


function removeAbsoluteCanvas(i) {}
for (let index in canvas) {
  let cont = parseInt(index) + 1;

  new Chart(canvas[index], {
    type: "line",
    data: {
      labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
      datasets: [
        {
          label: "field-" + cont,
          data: [12, 19, 3, 5, 2, 3],
          borderWidth: 1,
        },
      ],
    },
    options: {
      scales: {
        y: {
          beginAtZero: true,
        },
      },
    },
  });
}
