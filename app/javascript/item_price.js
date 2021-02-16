window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const saleProfit = document.getElementById("profit");
    const valueResult = Math.floor( inputValue * 0.1 );
    addTaxDom.innerHTML =  valueResult;
    saleProfit.innerHTML = inputValue - valueResult;
  })
});