const reservationsToggle = () => {
  const sections = document.querySelectorAll(".calendrier-section");
  const indexResa = document.querySelector(".calendrier-index");
  const newResa = document.querySelector(".calendrier-new");
  // const ou = document.querySelector("#ou");
  sections.forEach((section) => {
    section.addEventListener("click", (e) => {
      for (let i = 0; i < sections.length; i++) {
        if (sections[i] !== e.currentTarget) {
          sections[i].classList.add("downOpacity");
          sections[i].addEventListener(
            "transitionEnd",
            (section[i].style.display = "none")
          );
        }
        if (e.currentTarget.classList[1] === "section--1") {
          e.currentTarget.classList.add("growUpFromTop");
          newResa.classList.add("upOpacityModal");
          newResa.style.display = "block";
        } else {
          e.currentTarget.classList.add("growUpFromBottom");
        }
      }
    });
  });
};

export { reservationsToggle };
