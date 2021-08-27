const equipageToggle = () => {

    const crewcard = document.querySelectorAll(".crew-card");
    let compt = 0;

    if (crewcard) {
        crewcard.forEach(crew => {
            crew.addEventListener("click", e => {
                e.currentTarget.classList.toggle("active");
                for (let i = 0 ; i < crewcard.length ; i++) {
                    if(crewcard[i] !== e.currentTarget) {
                        crewcard[i].classList.remove("active")
                    };
                };
            })
        });
    };
};

export { equipageToggle }