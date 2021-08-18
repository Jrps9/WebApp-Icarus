const reservationsToggle = () => {
  const sections = document.querySelectorAll(".calendrier-section");
  const indexResa = document.querySelector(".calendrier-index");
  const newResa = document.querySelector(".calendrier-new");
  const cross = document.querySelector(".cross");
  const cross2 = document.querySelector(".cross2");
  sections.forEach((section) => {
    section.addEventListener("click", (e) => {
      for (let i = 0; i < sections.length; i++) {
        if (sections[i] !== e.currentTarget) {
          if (e.currentTarget.classList[1] === "section--1") {
            let section1 = e.currentTarget;
            let section2 = sections[i];
            section2.classList.remove("opacityPlus");
            section2.classList.add("opacityMoins");
            section1.classList.remove("growDownSection1");
            section1.classList.add("growUpSection1");
            newResa.classList.add("upOpacityModal");
            newResa.style.display = "flex";
            cross.addEventListener("click", () => {
              newResa.classList.remove("upOpacityModal");
              newResa.classList.add("opacityMoins");
              section1.classList.remove("growUpSection1");
              section1.classList.add("growDownSection1");
              newResa.style.display = "none";
              section2.classList.remove("opacityMoins");
              section2.classList.add("opacityPlus");
            });
          } else {
            let section2 = e.currentTarget;
            let section1 = sections[i];
            section1.classList.remove("opacityPlus");
            section1.classList.add("opacityMoins");
            section2.classList.add("growUpSection2");
            section2.classList.remove("growDownSection2");
            indexResa.classList.add("upOpacityModal");
            indexResa.style.display = "flex";
            cross2.addEventListener("click", () => {
              console.log("coucou")
              indexResa.classList.remove("upOpacityModal");
              indexResa.classList.add("opacityMoins");
              section2.classList.remove("growUpSection2");
              section2.classList.add("growDownSection2");
              indexResa.style.display = "none";
              section1.classList.remove("opacityMoins");
              section1.classList.add("opacityPlus");
            });
          }
        }
      }
    });
  });
};

export { reservationsToggle };
