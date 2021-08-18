import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";
import 'flatpickr/dist/themes/dark.css'

const initFlatpickr = () => {
  flatpickr("#start_day", {
      altInput: true,
      plugins: [new rangePlugin({ input: "#end_day"})],
      minDate: "today",
      inline: true,
      allowInput: true,
  });
}

export { initFlatpickr };