const reservationsToggle = () => {
  const sections = document.querySelectorAll(".calendrier-section");
  // const ou = document.querySelector("#ou");
  sections.forEach((section) => {
    section.addEventListener("click", (e) => {
      for (let i = 0; i < sections.length; i++) {
        if (sections[i] !== e.currentTarget) {
          sections[i].classList.add("no-display");
        }
        if (e.currentTarget.classList[1] === "section--1") {
          e.currentTarget.classList.add("growUpFromTop");
        } else {
          e.currentTarget.classList.add("growUpFromBottom");
        }
      }
    });
  });
};

export { reservationsToggle };
