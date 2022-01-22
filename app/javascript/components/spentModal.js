const newSpentModal = () => {
  const trigger = document.querySelector("#newSpent");

  if (trigger) {
      const bg = document.querySelector(".container-icarus");
      const modal = document.querySelector(".newSpentModal")
      trigger.addEventListener("click", e => {
          console.log("cliquant")
          modal.style.display="block";
          bg.classList.add("bgOpacity");
      })
  }
}

export { newSpentModal }