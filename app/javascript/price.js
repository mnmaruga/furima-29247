function calc () {
  const price = document.getElementById("item-price");
  price.addEventListener('input', (e) => {
    let tax = document.getElementById("add-tax-price");
    let sum1 = parseInt(price.value, 10) / 10;
    tax.innerHTML = Math.round(sum1);
    let profit = document.getElementById("profit");
    let sum2 = parseInt(price.value, 10) - Math.round(sum1)
    profit.innerHTML = sum2
    e.preventDefault();
  });
}
window.addEventListener("load", calc);