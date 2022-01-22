import e from "turbolinks";

const toggleList = () => {
  const triggerBtns = document.querySelectorAll(".accordeon");
  if (triggerBtns) {
    triggerBtns.forEach((btn) => {
      btn.addEventListener("click", (e) => {
        for (let i = 0; i < triggerBtns.length; i++) {
          if (e.currentTarget == triggerBtns[i]) {
            triggerBtns[i].closest("section").classList.toggle("open");
            Array.from(e.currentTarget.classList).includes("fa-minus")
              ? (e.currentTarget.classList = "fas fa-plus accordeon --plusrot")
              : (e.currentTarget.classList =
                  "fas fa-minus accordeon --moinsrot");
          } else {
            triggerBtns[i].closest("section").classList.remove("open");
            triggerBtns[i].classList = "fas fa-plus accordeon --plusrot";
          }
        }
      });
    });
    const scrollColumns = document.querySelectorAll(".scroll-column");
    if (scrollColumns) {
      triggerBtns.forEach((btn) => {
        btn.addEventListener("click", (e) => {
          let triggerNumber = e.currentTarget.dataset.trigger
          for (let i = 0; i < scrollColumns.length; i++) {
            let columnNumber = scrollColumns[i].dataset.trigger
            triggerNumber == columnNumber ?
            scrollColumns[i].classList.toggle("open")
            : scrollColumns[i].classList.remove("open")
           }
        })
      })
    }
  }
};

export { toggleList };
