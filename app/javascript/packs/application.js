require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

// External imports
import "bootstrap";
import 'controllers'

import Chart from 'chart.js/auto';
global.Chart = Chart;

import { equipageToggle } from '../components/equipage';
import { reservationsToggle } from '../components/reservations';
import { initFlatpickr } from "../plugins/flatpickr";
import { newSpentModal } from '../components/spentModal';
import { toggleList } from '../components/toggleList';
import { initChart} from '../plugins/chart';

document.addEventListener('turbolinks:load', () => {
  equipageToggle();
  reservationsToggle();
  initFlatpickr();
  newSpentModal();
  toggleList();
  initChart();
});
