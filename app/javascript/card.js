const pay = () => {
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("イベント発火");
  });
};

window.addEventListener("load", pay);