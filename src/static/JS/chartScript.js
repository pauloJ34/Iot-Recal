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
function createLastFieldData(title, data) {
	const last_data_variable = document.querySelector("#data-variables");
	let div = document.createElement("div");
	let strong = document.createElement("strong");
	let span = document.createElement("span");

	div.classList.add("data-field");
	strong.id = title;
	span.classList.add("data");

	strong.textContent = `${title.replace(" ", "-")}:`;
	span.textContent = data;

	div.appendChild(strong);
	div.appendChild(span);
	last_data_variable.appendChild(div);
}

function create_open_close(index) {
	const canvas = document.querySelectorAll(".canvas-chart");
	const div_canvas = document.querySelectorAll(".item-canvas");
	//const div_button_canvas = document.querySelectorAll(".close-tab");
	// const close_button_canvas = document.querySelectorAll(".close-icon");
	canvas[index].addEventListener("click", (e) => {
		//if (!div_button_canvas[index].classList.contains("is-displa:y-block")) {
		// div_button_canvas[index].classList.toggle("is-display-block");
		div_canvas[index].classList.toggle("is-absolute");
		//}
	});
	// close_button_canvas[inde:].addEventListener("click", (e) => {
	//   if (div_button_canvas[index].classList.contains("is-display-block")) {
	//     div_button_canvas[index].classList.remove("is-display-block");
	//     div_canvas[index].classList.remove("is-absolute");
	//   }
	// });
}

function add_statistics(data, index) {
	//console.log(data, "------------", index);

	// let cont = parseInt(index) + 1;
	const canvas = document.querySelectorAll(".canvas-chart")[index];
	const list_data_canvas = data[index];
	let columns = [];
	for (let item of list_data_canvas.column) {
		//console.log(item + "\n");
		const splitHour = item.split(" ")[1];
		const [hour, minute, secund] = splitHour.split(":");
		//console.log(hour);

		columns.push(`${hour}:${minute}`);
	}
	//console.log(columns);
	new Chart(canvas, {
		type: "line",
		data: {
			labels: columns,
			datasets: [
				{
					label: list_data_canvas.name,
					data: list_data_canvas.data,
					borderWidth: 1,
				},
			],
		},
		options: {
			onResize: () => {},
			scales: {
				y: {
					beginAtZero: true,
				},
			},
			plugins: {
				legend: {
					labels: {
						// This more specific font property overrides the global property
						font: {
							size: 14,
						},
					},
				},
				tooltip: {
					callbacks: {
						label: function (context) {
							const label = context.dataset.label.replace("field", "Field-");
							console.log(label);
							return `${label} = ${context.formattedValue}`;
						},
						title:
							//list_data_canvas.column,
							function (context) {
								return list_data_canvas.column[context[0].dataIndex].replaceAll(
									"-",
									"/",
								);
							},
					},
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
